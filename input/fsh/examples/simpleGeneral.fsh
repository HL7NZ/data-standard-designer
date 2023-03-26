//simple report
Instance: SimpleGeneral
InstanceOf: Questionnaire
Description: "A simple general form for testing the POC"

* url = "http://canshare.co.nz/fhir/Questionnaire/simplegeneral"
* status = #draft

* title = "Simple general form"
* useContext.code.system = "http://terminology.hl7.org/CodeSystem/usage-context-type"
* useContext.code.code = #focus
* useContext.valueCodeableConcept = http://canshare.co.nz/CodeSystem/Qtypes#general

//========= report section
* item[+].linkId = "intro"
* item[=].text = "Introduction"
* item[=].type = #group

* item[=].item[+].linkId = "cancertype"
* item[=].item[=].text = "Cancer type"
* item[=].item[=].type = #text


* item[=].item[+].linkId = "notes"
* item[=].item[=].text = "General notes"
* item[=].item[=].type = #text
