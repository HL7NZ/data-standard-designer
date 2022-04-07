Instance: procedurePerformed
InstanceOf: Procedure

//used at multiple places within the spreadsheet

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Biopsy</div>"
* text.status = #generated

* status = #completed
* code = $canshare#biopsy   "Biopsy"
* subject = Reference(patientLung)

* extension[0].url = "http://canshare.com/adjacentOrganInvolvement"
* extension[=].extension[+].url = "involved"
* extension[=].extension[=].valueBoolean = true
* extension[=].extension[+].url = "notes"
* extension[=].extension[=].valueString = "Deeply infiltrated into chest wall"

* extension[+].url = "http://canshare.com/adjacentOrganInvolvement"
* extension[=].valueString = "Unable to completely remove"


* note[0].text = "Here are other notes"
