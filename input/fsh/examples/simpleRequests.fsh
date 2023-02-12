


//simple request
Instance: SimpleRequest
InstanceOf: Questionnaire
Description: "A simple request for testing the POC"

* url = "http://canshare.co.nz/fhir/Questionnaire/simplerequest"
* status = #draft

* title = "Breast resection request form"
* useContext.code.system = "http://terminology.hl7.org/CodeSystem/usage-context-type"
* useContext.code.code = #focus
* useContext.valueCodeableConcept = http://canshare.co.nz/CodeSystem/Qtypes#request

//========= request section
* item[+].linkId = "findings"
* item[=].text = "Findings"
* item[=].type = #group

* item[=].item[+].linkId = "location"
* item[=].item[=].text = "Location of tumour"
* item[=].item[=].type = #text
* item[=].item[=].code.system = "http://canshare.co.nz/CodeSystem/SP"
* item[=].item[=].code.code = #location

* item[=].item[+].linkId = "nodes"
* item[=].item[=].text = "Involvement of nodes"
* item[=].item[=].type = #text
* item[=].item[=].code.system = "http://canshare.co.nz/CodeSystem/SP"
* item[=].item[=].code.code = #nodes


//another simple request
Instance: SimpleRequest1
InstanceOf: Questionnaire
Description: "A simple request for testing the POC"

* url = "http://canshare.co.nz/fhir/Questionnaire/simplerequest1"
* status = #draft

* title = "Biopsy"
* useContext.code.system = "http://terminology.hl7.org/CodeSystem/usage-context-type"
* useContext.code.code = #focus
* useContext.valueCodeableConcept = http://canshare.co.nz/CodeSystem/Qtypes#request

//========= request section
* item[+].linkId = "site"
* item[=].text = "Site"
* item[=].type = #group

* item[=].item[+].linkId = "lat"
* item[=].item[=].text = "Breast laterality"
* item[=].item[=].type = #choice
* item[=].item[=].code.system = "http://canshare.co.nz/CodeSystem/SP"
* item[=].item[=].code.code = #lat
* item[=].item[=].answerOption[+].valueCoding = http://canshare.co.nz/CodeSystem/SP#left "Left"
* item[=].item[=].answerOption[+].valueCoding = http://canshare.co.nz/CodeSystem/SP#right "Right"


* item[=].item[+].linkId = "quad"
* item[=].item[=].text = "Quadrant"
* item[=].item[=].type = #string
* item[=].item[=].code.system = "http://canshare.co.nz/CodeSystem/SP"
* item[=].item[=].code.code = #quad

* item[=].item[+].linkId = "orient"
* item[=].item[=].text = "Orientation (oclock)"
* item[=].item[=].type = #string
* item[=].item[=].code.system = "http://canshare.co.nz/CodeSystem/SP"
* item[=].item[=].code.code = #orient

* item[=].item[+].linkId = "dist"
* item[=].item[=].text = "Distance from nipple"
* item[=].item[=].type = #string
* item[=].item[=].code.system = "http://canshare.co.nz/CodeSystem/SP"
* item[=].item[=].code.code = #dist

* item[=].item[+].linkId = "notes"
* item[=].item[=].text = "Any other noted"
* item[=].item[=].type = #text
* item[=].item[=].code.system = "http://canshare.co.nz/CodeSystem/SP"
* item[=].item[=].code.code = #notes