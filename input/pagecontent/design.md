### FHIR design

The following graph represents the overall graph representing the Structured Pathology request


<img src="pathrequest.png"/>

When a pathology request is generated:

* The clinician completes a form, whose content is defined by the Questionnaire resource. The questionnaire 
contains the questions to be answered (which may be pre-populated from some back end source such as the NHI) or may be entered by the user. In some cases there are picklists or selection boxes, in others it is plain text. In an ideal world, the UI app would be able to generate the interface directly from the information in the Questionnaire.
* The completed data is saved in a QuestionnaireResponse resource, which is associated with the ServiceRequest through the 'supportingInfo' element. It is also feasible to extract other FHIR resources from the QuestionnaireResponse if needed.
* Other supporting resources - such as a specimen resource, and Patient are referenced by the ServiceRequest
* There is also a Task resource represented in the diagram above. This is used to track the completion of the pathology request if it is desired to do that in the system.

### Roles

The following roles are defined (These are from the [Structured Data Capture (SDC) Implementation Guide](http://hl7.org/fhir/us/sdc/) )

* Form Designer. The system that creates and maintains the form definitions (Questionnaire). In this IG, the Questionnaires are defined within the IG, and are uploaded manually to the Form Manager.
* Form Manager. The system that stores the Questionnaire resources, and makes them available to clients via the standard RESTful API.
* Form Filler. The system that takes a Questionnaire, generates the User Interface, interacts with the user to complete the form and generates the QuestionnaireResponse resource that represents the data entered by the user.
* Form Receiver. The system where the completed forms (as a QuestionnaireResponse) are saved.


### Questionnaire and QuestionnaireResponse

The Questionnaire (Q) and QuestionnaireResponse (QR) resources are designed to work together. 

The Q is the definition of the form (and in this IG is also the source of the Data Model) and contains all the information that defines the forms contents. It is quite possible to have a client application that can generate the User Interface dynamically from the Q, or it can simply be used by the developer creating the form UI as the definition of the form - what that contents are, and any validation / interaction between form elements.

The advantage of generating the form from the Q is that once done, it can be used for any particular form without modification, saving implementer time. The disadvantage is that the design and build of the client is initially more complex.

There are a number of applications available that can generate forms - for an example see the [clinFHIR form display](http://clinfhir.com/QBuilder.html) - though this is a simple 'reference' application built for this IG and not intended for real world use.

The QR resource holds the information entered by the user. Fundamentally it is a simple collection of the answers given (whether directly by the user or pre-populated by the Form Filler). The QR has a link back to the Q that it relates to (QR.questionnaire has the Q.url element).

The QR can be used in a number of ways.

* It could be used by the recipient of the data directly. For example, in this IG the QR is made directly available to the pathologist who is examining the specimen/s. It is the responsibility of the recipient to generate a user readable view of the QR content for the pathologist. This is generally a simple matter of iterating over the QR content and rendering a view. If the app needs to access the Q, then it can retrieve it from the Form Manager.
* The contents of the QR can be used to generate FHIR resources that can then be stored in any system. The information needed to do this is embedded in the Q & QR resources. For example, if one of the questions is the patients weight, then the data from the QR can be used to generate the Observation. In this case, the Q needs to be designed with this capability in mind.





### Architecture

In the reference implementation for this IG, the architecture consists of 3 main systems.

* The data store (a FHIR server) acts as Form Manager and Form Receiver - ie it stores the Questionnaires and the QR's that are generated for each request
* The Form Filler application where the user will enter the details of a single pathology request
* The pathologist system that represents the pathologist 


### Workflow

The following is the workflow that is used to facilitate the interaction between the requesting clinician and the pathologist. It is assumed that the Q has been designed and uploaded to the Forms Manager

1. The clinician uses the Form Filler App, which downloads the Q from the Form Manager and generates the UI. If the UI has been manually created by the app developer, then the Q is not needed - although the Form Filler will still need the url of the Q, as it needs to be added to the QR. In this situation, versioning will need to be considered carefully as the Q and the UI presented by the form filler should match.

1. When the clinician enters the NHI for the patient, the Form Filler will retrieve the patient, and pre-populate the 

2. The clinician enters all the information required, and 'sends' the pathology request to the server. There are a number of approaches for this - the one described here assumes that the resources are added to a Transaction bundle and POSTed to the FHIR server, as this is the simplest for the client. Other approaches are possible.

3. The Form Filler then:
   1. Creates a transaction bundle and adds the Patient & Practitioner resources to it. 
   2. The Organization or Practitioner representing the pathologist practice is added. 
   3. Generates the QR with appropriate references and adds that to the bundle. The structure of the QR needs to match that of the Q - ie the item indenting must be the same.
   4. Generates a ServiceRequest resource (that represents the act of making the request) and adds that to the bundle
   5. Generates a Task resource (status = 'requested') and adds that to the bundle. This is an optional step, but will greatly facilitate the workflow.
   6. POSTs the transaction bundle to the server.
   7. The FHIR server will then save the resources. Refer to the diagram at the top of the page for a graph of these resources

4. The pathologist system then retrieves the task, and from that the details of the request. This can be done using a simple polling method, as the load is likely to be light and the response time is not urgent. A pub/sub mechanism can be implemented later. When the pathologist system 'downloads' the request, it will set the Task status to 'accepted' to indicate to the sender that it has been received. Alternatively - 'in-progress' might be a better choice depending on the granularity with which the Task is updated.

5. Eventually, the specimen/s have been examined and a report generated. This will be represented by a DiagnosticReport resource, optionally with associated Observations. These are uploaded to the server and the Task status changed to 'completed'. Potentially, the pathologist system could also create a Task directed to the clinician to track the clinician review of the report.

