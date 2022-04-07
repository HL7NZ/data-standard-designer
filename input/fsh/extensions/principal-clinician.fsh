Extension: PrincipalClinician
Id: principal-clinician
Description: "The practitioner who is the principal carer for the patient for this condition"

* ^url = "http://canshare.com/fhir/StructureDefinition/principal-clinician"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ


* ^context.type = #element
* ^context.expression = "ServiceRequest"



* value[x] only Reference(Practitioner)

