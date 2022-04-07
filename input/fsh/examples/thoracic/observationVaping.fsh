Instance: observationVaping
InstanceOf: Observation

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Vaping status</div>"
* text.status = #generated

* status = #final
* code = $canshare#vap "Vaping Status"
* subject = Reference(patientLung)

* valueCodeableConcept = $canshare#current "Current Vaper"