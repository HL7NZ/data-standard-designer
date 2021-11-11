//===================== example of bundle =================
//=== not using any  profiles
Instance:       examplePatient
InstanceOf:     Patient

* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">John Doe</div>"
* name.family = "Doe"
* name.given = "John"
* name.text = "John Doe"
* birthDate = "1988-01-01"
* gender = #male
* extension[+].url = "http://hl7.org.nz/fhir/StructureDefinition/nz-ethnicity"
* extension[=].valueCodeableConcept = https://standards.digital.health.nz/ns/ethnic-group-level-4-code#21111 "Maori"

* identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* identifier.value = "ABC1234"

//------ The author of the request - assumed to be a clinician
Instance:       author1
InstanceOf:     Practitioner

* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Marcus Welby</div>"

* name.family = "Welby"
* name.given = "Marcus"
* name.text = "Marcus Welby"

* identifier.system = "https://standards.digital.health.nz/ns/hpi-person-id"
* identifier.value = "xxxx"

//------ the administrative data - the service request
Instance:       sr1
InstanceOf:     ServiceRequest

* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Request for biopsy</div>"

* identifier.system = "http://example.org/system"       //todo
* identifier.value = "yyyy"
* status = #active
* intent = #order
* authoredOn =  "2020-11-12" 
* subject =  Reference(examplePatient)
* requester = Reference(author1)
* specimen = Reference(specimen1)

//-------- patient is a smoker
Instance:       exampleSmoker
InstanceOf:     Observation

* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Is a current smoker</div>"

* status = #final
* code = http://loinc.org#72166-2
* subject = Reference(examplePatient)
* effectiveDateTime = "2020-11-12"      //when it was stated that the patient is a smoker
* performer = Reference(author1)

//-------- Has had exposure to asbestos
Instance:       asbestosExposure
InstanceOf:     Observation

* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Has had exposure to asbestos</div>"

* status = #final
* code = http://loinc.org#unknown
* subject = Reference(examplePatient)
* effectiveDateTime = "2020-11-12"      //when it was stated that the patient is a smoker
* performer = Reference(author1)

//---------- the procedure representing the biopsy
//todo this needs discussion as it encompasses site and resection details from the LM
Instance:       biopsy1
InstanceOf:     Procedure

* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Lung biopsy</div>"

* status = #completed
* subject = Reference(examplePatient)
* performedDateTime = "2020-11-12"      //when the procedure was performed

* code = http:/example.org#unknown      //todo - code for a biopsy May need a set of options
* bodySite = $site-cs#rul               //todo - VS needs to be snomed...
* performer.actor = Reference(author1)

//---------- the specimen to be examined
Instance:       specimen1
InstanceOf:     Specimen

* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Lung biopsy tissue</div>"

* extension[+].url = "http://example.org/return-specimen"
* extension[=].valueBoolean = true

* status = #available
* subject = Reference(examplePatient)


* type = http://terminology.hl7.org/CodeSystem/v2-0487#TISS     //todo need VS
* collection.collector =  Reference(author1)                    // the author was the surgeon
* collection.bodySite = $site-cs#rul               //todo - VS needs to be snomed...  may be more granular than procedure bodySite
* collection.method = $snomed#129314006 "Biopsy - action"    

* container.description = "Lung tissue"


// ==================== The Bundle that contains all the resources
Instance:       exampleBundle
InstanceOf:     Bundle

* type = #transaction

* entry[+].resource = examplePatient
//The full url is set to the NHI. In that system the id is the same as the active NHI number (identifier)
// Not sure about this. * entry[=].fullUrl = "http://moh/nhi/ABC1234"
* entry[=].request.method = #POST
* entry[=].request.url = "Patient"
* entry[=].request.ifNoneExist = "identifier=https://standards.digital.health.nz/ns/nhi-id|ABC1234"

* entry[+].resource = author1
* entry[=].request.method = #POST
* entry[=].request.url = "Practitioner"
* entry[=].request.ifNoneExist = "identifier=https://standards.digital.health.nz/ns/hpi-person-id|xxxx"

* entry[+].resource = sr1
* entry[=].request.method = #POST
* entry[=].request.url = "ServiceRequest"

* entry[+].resource = exampleSmoker
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"

* entry[+].resource = biopsy1
* entry[=].request.method = #POST
* entry[=].request.url = "Procedure"

* entry[+].resource = specimen1
* entry[=].request.method = #POST
* entry[=].request.url = "Specimen"