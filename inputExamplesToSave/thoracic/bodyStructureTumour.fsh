Instance: bodyStructureTumour
InstanceOf: BodyStructure

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Tumour</div>"
* text.status = #generated

* patient = Reference(patientLung)

//where in the body the tumour was located. Multiple rows refer to this (23,24,25)
* location = $snomed#9875009 "Thymus"

* description = "Other details here"



