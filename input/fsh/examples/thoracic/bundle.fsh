Instance: lungRequest
InstanceOf: Bundle
Description: "A Bundle containing all the base resources for the canshare db after clearing"
* type = #collection

//base resources
* entry[+].resource = patientLung
* entry[+].resource = practitionerCC
* entry[+].resource = practitionerRequesting
* entry[+].resource = serviceRequestLung

* entry[+].resource = observationSS
* entry[+].resource = observationVaping

* entry[+].resource = observationAsbestos    
* entry[+].resource = observationPresenting
* entry[+].resource = observationCyto
* entry[+].resource = observationPreviousTx
* entry[+].resource = observationPreviousDx
* entry[+].resource = observationRelevantRadiol
* entry[+].resource = observationNeoadjuvent
* entry[+].resource = observationOtherrelevant
* entry[+].resource = procedurePerformed
* entry[+].resource = observationIndication
* entry[+].resource = bodyStructureTumour
* entry[+].resource = specimen1
* entry[+].resource = mediaImage