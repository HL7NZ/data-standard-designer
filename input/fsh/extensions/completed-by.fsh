Extension: CompletedBy
Id: completed-by
Description: "The practitioner who completed the request"

* ^url = "http://canshare.com/fhir/StructureDefinition/completed-by"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ


* ^context.type = #element
* ^context.expression = "ServiceRequest"



* value[x] only Reference(Practitioner)

