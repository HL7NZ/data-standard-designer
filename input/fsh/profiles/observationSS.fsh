Profile:        ObservationSS
Parent:         Observation
Id:             observation-ss
Title:          "Smoking Status"
Description:    "An observation for smoking status"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/spath-observation-ss"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Smoking Status Observation profile</div>"

//fix the code value
* code = $canshare#ss (exactly)

//can only be a CodeableConcept
* value[x] only CodeableConcept

//the possible values - a required (closed) ValueSet
//todo * valueCodeableConcept from $ss-vs (required)


