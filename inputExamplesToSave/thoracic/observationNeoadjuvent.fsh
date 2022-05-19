Instance: observationNeoadjuvent
InstanceOf: Observation
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Neo adjucent therapy</div>"
* text.status = #generated
* status = #final
* code = $canshare#neo "Neoadjuvent therapy"
* subject = Reference(patientLung)

//value can either be cc or string

* valueCodeableConcept = $canshare#notadmin "Not administered"
//* valueString = "details of therapy"
