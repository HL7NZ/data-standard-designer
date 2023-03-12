Alias: $definitionExtraction = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext


//simple request
Instance: SimpleRequest
InstanceOf: Questionnaire
Description: "A simple request for testing the POC"

* url = "http://canshare.co.nz/fhir/Questionnaire/simplerequest"
* status = #draft

* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
* extension[=].valueCode = #Procedure

* title = "Breast resection request form"
* useContext.code.system = "http://terminology.hl7.org/CodeSystem/usage-context-type"
* useContext.code.code = #focus
* useContext.valueCodeableConcept = http://canshare.co.nz/CodeSystem/Qtypes#request

//========= request section

//------- admin section
* item[+].linkId = "admin"
* item[=].text = "Administrative"
* item[=].type = #group

//an element whose options come from a ValueSet
* item[=].item[+].linkId = "pho"
* item[=].item[=].text = "PHO"
* item[=].item[=].type = #choice
* item[=].item[=].code.system = "http://canshare.co.nz/CodeSystem/SP"
* item[=].item[=].code.code = #pho

* item[=].item[=].answerValueSet = "https://nzhts.digital.health.nz/fhir/ValueSet/pho-code"


//--------- procedure section
* item[+].linkId = "procedure"
* item[=].text = "Procedure"
* item[=].type = #group

//procedure group 1
* item[=].item[+].linkId = "procGroup1"
* item[=].item[=].text = "Procedure performed"
* item[=].item[=].type = #group
//mark this group as defining the definition based extraction for a Procedure

//uses the pattern where the value of the answer is the procedure code
* item[=].item[=].extension[0].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
* item[=].item[=].extension[0].valueCode = #Procedure


* item[=].item[=].item[+].linkId = "procedurecode"
* item[=].item[=].item[=].text = "Procedure"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].definition = "http://hl7.org/fhir/Procedure#Procedure.code"

//the answers have the code for the procedure
* item[=].item[=].item[=].answerOption[+].valueCoding = http://mycode#code1 "Biopsy"
* item[=].item[=].item[=].answerOption[+].valueCoding = http://mycode#code2 "Resection"


//this is another procedure, with the item code as the procedure code and the answer being yes or no
//the group
* item[=].item[+].linkId = "procGroup2"
* item[=].item[=].text = "Lymph Node biopsy"
* item[=].item[=].type = #group
* item[=].item[=].extension[0].url = $definitionExtraction
* item[=].item[=].extension[0].valueCode = #Procedure

// the question 
* item[=].item[=].item[+].linkId = "procedurecode1"
* item[=].item[=].item[=].text = "Was a lymph node biopsy performed"
* item[=].item[=].item[=].type = #boolean
* item[=].item[=].item[=].code = http://mycode#code3 "Lymph node biopsy"    //the code for the resource
* item[=].item[=].item[=].definition = "http://hl7.org/fhir/Procedure.code"



//another using the the item code as the procedure.code but the answer is a coding
* item[=].item[+].linkId = "procGroup3"
* item[=].item[=].text = "Was a reconstruction done"
* item[=].item[=].type = #group
* item[=].item[=].extension[0].url = $definitionExtraction
* item[=].item[=].extension[0].valueCode = #Procedure

// the question 
* item[=].item[=].item[+].linkId = "breast-reconstruction"
* item[=].item[=].item[=].text = "Was a breast reconstruction performed"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].code = http://mycode#code3 "Lymph node biopsy"    //the code for the resource
* item[=].item[=].item[=].definition = "http://hl7.org/fhir/Procedure.code"
* item[=].item[=].item[=].answerOption[+].valueCoding = http://canshare.co.nz/CodeSystem/SP#yes "Yes"
* item[=].item[=].item[=].answerOption[+].valueCoding = http://canshare.co.nz/CodeSystem/SP#No "No"







/*
//location
* item[=].item[+].linkId = "location"
* item[=].item[=].text = "Location of tumour"
* item[=].item[=].type = #text
* item[=].item[=].code.system = "http://canshare.co.nz/CodeSystem/SP"
* item[=].item[=].code.code = #location

*/

* item[+].linkId = "findings"
* item[=].text = "Findings"
* item[=].type = #group



* item[=].item[+].linkId = "location"
* item[=].item[=].extension[0].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract"
* item[=].item[=].extension[0].valueBoolean = true
* item[=].item[=].text = "Location of tumour"
* item[=].item[=].type = #text
* item[=].item[=].code.system = "http://canshare.co.nz/CodeSystem/SP"
* item[=].item[=].code.code = #location

* item[=].item[+].linkId = "nodes"
* item[=].item[=].extension[0].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract"
* item[=].item[=].extension[0].valueBoolean = true
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