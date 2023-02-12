

//simple report
Instance: SimpleReport
InstanceOf: Questionnaire
Description: "A simple report for testing the POC"

* url = "http://canshare.co.nz/fhir/Questionnaire/simplereport"
* status = #draft

* title = "Histology report form"
* useContext.code.system = "http://terminology.hl7.org/CodeSystem/usage-context-type"
* useContext.code.code = #focus
* useContext.valueCodeableConcept = http://canshare.co.nz/CodeSystem/Qtypes#report

//========= report section
* item[+].linkId = "report"
* item[=].text = "Report"
* item[=].type = #group

* item[=].item[+].linkId = "histology"
* item[=].item[=].text = "Histology notes"
* item[=].item[=].type = #text
* item[=].item[=].code.system = "http://canshare.co.nz/CodeSystem/SP"
* item[=].item[=].code.code = #histo
* item[=].item[=].code.display = "Histology"

* item[=].item[+].linkId = "notes"
* item[=].item[=].text = "Other notes"
* item[=].item[=].type = #text
* item[=].item[=].code.system = "http://canshare.co.nz/CodeSystem/SP"
* item[=].item[=].code.code = #other
* item[=].item[=].code.display = "Other notes"

//another simple report
Instance: SimpleReport1
InstanceOf: Questionnaire
Description: "A simple report for testing the POC"

* url = "http://canshare.co.nz/fhir/Questionnaire/simplereport1"
* status = #draft

* title = "Macro/Micro report form"
* useContext.code.system = "http://terminology.hl7.org/CodeSystem/usage-context-type"
* useContext.code.code = #focus
* useContext.valueCodeableConcept = http://canshare.co.nz/CodeSystem/Qtypes#report

//========= report section
* item[+].linkId = "find"
* item[=].text = "Findings"
* item[=].type = #group

* item[=].item[+].linkId = "macro"
* item[=].item[=].text = "Macroscopic findings"
* item[=].item[=].type = #text
* item[=].item[=].code.system = "http://canshare.co.nz/CodeSystem/SP"
* item[=].item[=].code.code = #macro
* item[=].item[=].code.display = "Macroscopic findings"

* item[=].item[+].linkId = "micro"
* item[=].item[=].text = "Microscopic findings"
* item[=].item[=].type = #text
* item[=].item[=].code.system = "http://canshare.co.nz/CodeSystem/SP"
* item[=].item[=].code.code = #micro

// -------------------------------------------------------------------
Instance: insituReport
InstanceOf: Questionnaire
Description: "The tempale for in-situ reporting"

* url = "http://canshare.co.nz/fhir/Questionnaire/insitu-report"
* status = #draft

* title = "Insitu report form"
* useContext.code.system = "http://terminology.hl7.org/CodeSystem/usage-context-type"
* useContext.code.code = #focus
* useContext.valueCodeableConcept = http://canshare.co.nz/CodeSystem/Qtypes#report

//DCIS 
* item[+].linkId = "dcis"
* item[=].text = "DCIS"
* item[=].type = #group


* item[=].item[+].linkId = "ap"
* item[=].item[=].text = "Anterior to Posterior"
* item[=].item[=].type = #integer
* item[=].item[=].code.system = "http://canshare.co.nz/CodeSystem/SP"
* item[=].item[=].code.code = #ap
* item[=].item[=].code.display = "AP"


* item[=].item[+].linkId = "si"
* item[=].item[=].text = "Superior to Inferior"
* item[=].item[=].type = #integer
* item[=].item[=].code.system = "http://canshare.co.nz/CodeSystem/SP"
* item[=].item[=].code.code = #si
* item[=].item[=].code.display = "SI"

* item[=].item[+].linkId = "ml"
* item[=].item[=].text = "Medial to lateral"
* item[=].item[=].type = #integer
* item[=].item[=].code.system = "http://canshare.co.nz/CodeSystem/SP"
* item[=].item[=].code.code = #ml
* item[=].item[=].code.display = "ML"

//Architecture
* item[+].linkId = "arch1"
* item[=].text = "Architecture"
* item[=].type = #group

* item[=].item[+].linkId = "arch"
* item[=].item[=].text = "Architecture"
* item[=].item[=].type = #choice
* item[=].item[=].code.system = "http://canshare.co.nz/CodeSystem/SP"
* item[=].item[=].code.code = #arch
* item[=].item[=].code.display = "Architecture"

* item[=].item[=].answerOption[+].valueCoding = http://canshare.co.nz/CodeSystem/SP#crib "Cribriform"
* item[=].item[=].answerOption[+].valueCoding = http://canshare.co.nz/CodeSystem/SP#micro "Micropapillary"
* item[=].item[=].answerOption[+].valueCoding = http://canshare.co.nz/CodeSystem/SP#pap "Papillary"
* item[=].item[=].answerOption[+].valueCoding = http://canshare.co.nz/CodeSystem/SP#solid "Solid"
* item[=].item[=].answerOption[+].valueCoding = http://canshare.co.nz/CodeSystem/SP#mixed "Mixed"
* item[=].item[=].answerOption[+].valueCoding = http://canshare.co.nz/CodeSystem/SP#other "Other"