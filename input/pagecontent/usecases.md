There are 3 primary Use cases supported by this IG

* Creating and submitting a structured pathology request by a clinician
* The Pathologist receiving the request and creating a report
* The submitting clinician reviewing the report

All of the use cases are orchestrated by an instance of the Task resource

For the purposes of these use cases, it is assumed that there are 5 principle actors.

* A FHIR server that acts as a Forms Manager (holding the Questionnaires)
* A FHIR server that acts as a data server - holding the Task, QuestionnaireResponse, DiagnosticReport and other supporting resources. This may be the same instance as the Forms Manager.
* An application that acts as the form filler - presenting a form to the clinician and generating the QuestionnaireResponse resource
* An application that supports the pathologist - displaying the completed form and generating the report
* An application that displays the pathologist report and updates the task

> a use case diagram here

### Create the structured pathology request

This use case describes how the clinician generates the structured pathology request from a Questionnaire based template.

#### Pre conditions
The patient and practitioner are in context. 
The organization which will be the target of the request has been selected
The form filler app could be a SMART app launched within the context of an EHR , but this is not required

#### Usual Flow

The clinician selects the template (Questionnaire) that is appropriate for this type of request (eg for a Lung biopsy)
The app generates the form based on the Questionnaire and pre-populates the information that it can. In particular it can pre-populate patient and sender (practitioner) details, but potentially other clinical details as well, depending on what information it has available.


#### Submission bundle
The information in the pathology request is represented as a collection of resources in a bundle. In the current reference architecture, the server exposes a FHIR interface, storing the resources as native resources (ie there is minimal, if any, business processing performed by the server.)

The bundle type is 'transaction', meaning that the server will store the resources as if they were posted directly through the RESTful interface, and will subsequently be available to query through the RESTful interface. The http methods used are a combination of POST and PUT with [conditional create]() being used in some cases.

In the [reference implementation]() the resource ids are assigned by the client, but in the pilot system these may be UUIDs, with the server assigning the ids during transaction processing.

The following resources are included in the bundle, which is POSTed to the server root as described in [FHIR transaction processing]()

> graph here

(? discuss references)

<table class = "table table-bordered">
    <tr><th>Resource type</th><th>Notes</th></tr>
    <tr>
        <td>[Patient]()</td>
        <td>Represents the patient. Either the client (form filler) has retrieved the resource from the server prior to creating the bundle, or it could be a conditional create based on the identifier (using the NHI)</td>
    </tr>

    <tr>
        <td>Practitioner</td>
        <td>The clinician submitting the pathology request. Like the Patient, this could be retrieved before the bundle is created, or submitted as a conditional create</td>
    </tr>


    <tr>
        <td>Organization</td>
        <td>The organization that represents the pathology lab where the request is directed. Potentially the request could be directed to an individual pathologist, in which case a Practitioner would be used. In the reference application, the lab would 'poll' for new requests (agains the Task resource). Other possibilities are a pub/sub arrangement, though this would require significant supporting infrastructure and design.
        </td>
    </tr>

    <tr>
        <td>QuestionnaireResponse</td>
        <td>The contents of the request. There is a canonical reference to the defining Questionnaire. The resource structure (indenting of .item) matches the Questionnaire resource that contains the form definition, and used by the client to generate the form UI. (Or the client could have custom UI which is selected based on the Questionnaire url). The actual Questionnaire is not included in the bundle, as it can be accessed from the form server at any stage of processing.</td>
    </tr>

    <tr>
        <td>ServiceRequest</td>
        <td>These are the administrative details of the request. </td>
    </tr>

    <tr>
        <td>Task</td>
        <td>Used to track the overall progress of thw workflow. This includes the viewing if the report (signed off) by the requesting clincian. In the reference implementation the Task is created and updated by the client apps (form filler and pathology system). In a pilot or production system this could be server responsibility. 
        <div>The matrix of attribute for business state of the workflow is given below</div>
        </td>
    </tr>

        <tr>
        <td>Specimen</td>
        <td>Represents the tissue samples that are to be examined.</td>
    </tr>

</table>

>> discuss all task attributes - possibly other resources as well
>> also discuss Task resource versioning (? add to RI - or just use server query)

#### Task attributes

A number of the Task attributes are used to indicate where the request state is in the workflow.

<table>
    <tr><th>Business state in workflow</th><th>.status</th><th>.businessStatus</th><th>.owner</th></tr>
    <tr>
        <td>A newly created request</td>
        <td>requested</td>
        <td>new-request</td>
        <td>Path lab</td>
    </tr>
    <tr>
        <td>Examination in progress</td>
        <td>in-progress</td>
        <td>accepted-request</td>
        <td>Path lab</td>
    </tr>
    <tr>
        <td>Report completed</td>
        <td>in-progress</td>
        <td>report-available</td>
        <td>Clinician</td>
    </tr>
        <tr>
        <td>Report viewed by clinician</td>
        <td>completed</td>
        <td>report-viewed</td>
        <td>?</td>
    </tr>

</table>

### Accept request

The pathology lab periodically polls the FHIR server for new pathology requests. This could be supported by pub/sub. The request is:

>GET [host]/Task?owner={organization}&business-status=new-request

(There may be _include parameters to facilitate return of resources. todo: list params )

The lab will pull data from the server to populate it's own internal systems, and will update the Task to indicate that the request has been received by the lab, and is being processed. The url is:

> PUT [host]/Task/{taskId}


### Generate the report

Eventually, the lab will create the report. This will be a combination of DiagnosticReport and Observation resources, depending on the capability of the lab system. There are 2 tasks that the lab must perfrom:
* Upload the report to the server
* Update the Task

#### Upload the report to the server

Depending on the complexity of the report (ie the number of resources that it contains) this could either be using a transaction like the path request, or individual resource POSTing. At the minimum, a DiagnosticReport resource is expected.

#### Update the Task

The task status is updated to indicate that the report has been generated, and is available for review by the sending clinician. See the table above for the statuses to set - in particular note that the owner of the task is set to the sending clinician. The actual update can either by by a direct PUT to the Task endpoint, or the task could be updated and included in a transaction bundle.


### View the report

This represents the viewing of the report by the sending clinician. Like the path lab receiving the request, the simplest way to do this is to periodically request against the Task resource for reports from the server (ie polling) using the request below:

>GET [host]/Task?owner={organization}&business-status=report-available

The Task has references (direct or recursive) to the report, and to the other resources that comprise the request.

To indicate that the report has been read, the client updates the task using a PUT to the Task endpoint setting the status to 'completed' and the business status to 'report-viewed'. This is the equivalent of 'signing off' the report. 

At this stage the workflow is complete.


### View outstanding requests

This Use Case allows the clinician to view the status of all outstanding requests.

>GET [host]/Task?owner={clinician}&business-status=in-progress,requested

The Task has references (direct or recursive) to the other resources that comprise the request.