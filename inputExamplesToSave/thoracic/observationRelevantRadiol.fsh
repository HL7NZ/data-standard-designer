Instance: observationRelevantRadiol
InstanceOf: Observation

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Relevant radiology</div>"
* text.status = #generated

* status = #final
* code = $canshare#pres "Relevant radiology"
* subject = Reference(patientLung)

//value can either be yes, no, unknown

* valueCodeableConcept = http://terminology.hl7.org/CodeSystem/v2-0136#N "No"
//* valueCodeableConcept = http://terminology.hl7.org/CodeSystem/data-absent-reason#asked-unknown "Don't know"
