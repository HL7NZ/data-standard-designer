### FHIR design

The following graph represents the overall graph representing the Structured Pathology request


<img src="pathrequest.png"/>

When a pathology request is generated:

* The clinician completes a form, whose content is defined by the Questionnaire resource. The questionnaire 
contains the questions to be answered (which may be pre-populated from some back end source such as the NHI) or may be entered by the user. In some cases there are picklists or selection boxes, in others it is plain text. In an ideal world, the UI app would be able to generate the interface directly from the information in the Questionnaire.
* The completed data is saved in a QuestionnaireResponse resource, which is associated with the ServiceRequest through the 'supportingInfo' element. It is also feasible to extract other FHIR resources from the QuestionnaireResponse if needed.
* Other supporting resources - such as a specimen resource, and Patient are referenced by the ServiceRequest
* There is also a Task resource represented in the diagram above. This is used to track the completion of the pathology request if it is desired to do that in the system.


  



