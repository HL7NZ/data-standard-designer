
//-----------  profiles on Observation for individual elements
Profile:        SmokerObservation
Parent:         Observation

* code = http://loinc.org#72166-2


Profile:        AsbestosObservation
Parent:         Observation

* code = http://loinc.org#72166-2

Profile:        PreviousCytologyObservation
Parent:         Observation

* code = http://loinc.org#72166-2

Profile:        PreviousTxObservation
Parent:         Observation

* code = http://loinc.org#72166-2


Profile:        PreviousCancerObservation
Parent:         Observation

* code = http://loinc.org#72166-2

/*
//This could just be an element on Specimen rather than a separate observation
Profile:        siteObservation
Parent:         Observation
*/

* code = http://loinc.org#72166-2

Profile:        ResectionObservation
Parent:         Observation

* code = http://loinc.org#72166-2


RuleSet: minimizeEntry (sliceName)
* entry[sliceName].search 0..0
* entry[{sliceName}].request 0..0
* entry[{sliceName}].response 0..0
* entry[{sliceName}].link 0..0
* entry[{sliceName}].id 0..0
* entry[{sliceName}].extension 0..0
* entry[{sliceName}].modifierExtension 0..0

//============ Bundle profile ==============
Profile:        LungCancerBundle
Parent:         Bundle
Id:             lcBundle
Title:          "Lung Cancer bundle"
Description:    "A bundle containing Lung Cancer resources"

* type = #transaction


* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open

* entry contains
    patient 1..1 and
    smokingStatus 0..1 and
    asbestos 0..1 and
    previousCytology 0..1 and
    previousTx 0..1 and
    previousCancer 0..1 and
    site 0..1 and
    resection 0..1 and
    specimen 0..* and
    serviceRequest 1..1 and
    image 0..1


* entry[patient].resource only Patient
* entry[patient] ^short = "Cancer Patient"
* entry[patient] ^definition = "The Cancer Patient whose data is included in the bundle (required element)."

* entry[patient].search 0..0
* entry[patient].request 0..0
* entry[patient].response 0..0
* entry[patient].link 0..0
* entry[patient].id 0..0
* entry[patient].extension 0..0
* entry[patient].modifierExtension 0..0



* entry[smokingStatus].resource only SmokerObservation
* entry[smokingStatus] ^short = "Smoking status for the patient"
* entry[smokingStatus] ^definition = "Previous exposure to asbestos"

* entry[smokingStatus].search 0..0
* entry[smokingStatus].request 0..0
* entry[smokingStatus].response 0..0
* entry[smokingStatus].link 0..0
* entry[smokingStatus].id 0..0
* entry[smokingStatus].extension 0..0
* entry[smokingStatus].modifierExtension 0..0


* entry[asbestos].resource only AsbestosObservation
* entry[asbestos] ^short = "Previous exposure to asbestos"
//* entry[asbestos] ^definition = "Previous exposure to asbestos"

* entry[asbestos].search 0..0
* entry[asbestos].request 0..0
* entry[asbestos].response 0..0
* entry[asbestos].link 0..0
* entry[asbestos].id 0..0
* entry[asbestos].extension 0..0
* entry[asbestos].modifierExtension 0..0

* entry[previousCytology].resource only PreviousCytologyObservation
* entry[previousCytology] ^short = "Previous cytology on this specimen"
* entry[previousCytology] ^definition = "Previous cytology on this specimen"



* entry[previousTx].resource only PreviousTxObservation
* entry[previousTx] ^short = "Previous treatment for this cancer"
* entry[previousTx] ^definition = "Previous treatment for this cancer"

* entry[previousCancer].resource only PreviousCancerObservation
* entry[previousCancer] ^short = "Any previous cancers for the patient"
* entry[previousCancer] ^definition = "Any previous cancers for the patient"

/*
* entry[site].resource only siteObservation
* entry[site] ^short = "Where"
* entry[site] ^definition = "The Patients smoking status"
*/
* entry[resection].resource only ResectionObservation
* entry[resection] ^short = "Details of the resection"
* entry[resection] ^definition = "Details of the resection"

* entry[specimen].resource only Specimen
* entry[specimen] ^short = "The specimen to be examined"
* entry[specimen] ^definition = "The specimen to be examined"

* entry[serviceRequest].resource only ServiceRequest
* entry[serviceRequest] ^short = "The administrative resource for the service request"
* entry[serviceRequest] ^definition = "The Patients smoking status"

* entry[image].resource only Media
* entry[image] ^short = "Any pictures or other images that accompany the request"
* entry[image] ^definition = "Any pictures or other images that accompany the request"








//https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/profiling.20a.20transaction
//https://chat.fhir.org/#narrow/stream/215610-shorthand/topic/Support.20for.20slicin
