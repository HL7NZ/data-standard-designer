Instance: observationPresenting
InstanceOf: Observation

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Presenting symptoms</div>"
* text.status = #generated

* status = #final
* code = $canshare#pres "Presenting symptoms"
* subject = Reference(patientLung)

//value can either be cc (no, unknown) or string

//* valueCodeableConcept = http://terminology.hl7.org/CodeSystem/v2-0136#N "No"
//* valueCodeableConcept = http://terminology.hl7.org/CodeSystem/data-absent-reason#asked-unknown "Don't know"
* valueString = "These are the symptoms"