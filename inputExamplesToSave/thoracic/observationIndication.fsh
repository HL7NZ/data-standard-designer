Instance: observationIndication
InstanceOf: Observation
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Clinical indication</div>"
* text.status = #generated

* status = #final
* code = $canshare#ind "Indication"
* subject = Reference(patientLung)

//value can either be cc (new primary, regional recurrance, distant metastasis) or string for other

//* valueCodeableConcept = 
* valueString = "other indication"