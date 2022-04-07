Instance: observationOtherrelevant
InstanceOf: Observation

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Other clinical info</div>"
* text.status = #generated

* status = #final
* code = $canshare#oitherrel "Other relevant clincial info"
* subject = Reference(patientLung)

//value can either be cc or string

* valueString = "Other clincial details here"
