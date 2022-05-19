Instance: observationSS
InstanceOf: ObservationSS

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Smoking status</div>"
* text.status = #generated

* status = #final
* code = $canshare#ss "Smoking Status"
* subject = Reference(patientLung)

* valueCodeableConcept = $canshare#currents "Current Smoker"
//* valueString = "test"