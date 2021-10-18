Instance: QTest
InstanceOf: Questionnaire
Description: "Test Questionnaire"

* url = "http://clinfhir.com/Questionnaire/test"
* status = #draft
* name = "TestForm"
* title = "A form to capture data to accompany a histology request for lung cancer"
* useContext.code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext.valueCodeableConcept = http://clinfhir.com#structuredPath

//--------- patient information 
* item[+].linkId = "patinfo"
* item[=].text = "Patient Information"
* item[=].type = #group
* item[=].extension[+].url = "http://clinfhir.com/structureDefinition/q-item-description"
* item[=].extension[=].valueString = "information about the patient"

* item[=].item[+].linkId = "nhi"
* item[=].item[=].text = "NHI"
* item[=].item[=].type = #string
* item[=].item[=].extension[+].url = "http://clinfhir.com/structureDefinition/q-item-description"
* item[=].item[=].extension[=].valueString = "The National Health Identifier"

* item[=].item[+].linkId = "fname"
* item[=].item[=].text = "First name"
* item[=].item[=].type = #string
* item[=].item[=].extension[+].url = "http://clinfhir.com/structureDefinition/q-item-description"
* item[=].item[=].extension[=].valueString = "The patients first name"

* item[=].item[+].linkId = "lname"
* item[=].item[=].text = "Last name"
* item[=].item[=].type = #string
* item[=].item[=].extension[+].url = "http://clinfhir.com/structureDefinition/q-item-description"
* item[=].item[=].extension[=].valueString = "The patients last name"