Structured Pathology IG

This IG describes how to represent information in a pathology request
for a lung cancer biopsy specimen in a structured fashion.

### Business requirements

To define pathology requests for histology that contain structured and coded information that is specific to the presumptive diagnosis - eg lung cancer. This information ensures that key information required by the pathologist is available to them when examining the specimen/s. It also supports the use of electronic decision support once available. The form definition must contain enough information to generate a User Interface as construct the data objects.

To describe how the workflow of making the request, and tracking its fulfillment can be supported using a FHIR infrastructure (specifically a server that exposes the required REST interfaces)

todo: create capstmt for the needed API


#### Exclusions

The IG does not (yet) cover the details of the pathology report, beyond describing the use DiagnosticReport and Observations.

### Forms 

Questionnaires currently defined:

* [Lung Cancer](Questionnaire-QLungCancer.html)

### Reference implementation

[clinFHIR form display](http://clinfhir.com/StructuredPathRequest.html)

[Local copy](http://localhost:8081/StructuredPathRequest.html)