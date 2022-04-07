Extension: CopyToFacility
Id: copy-to-facility
Description: "The facility that should receive a copy of the request"

* ^url = "http://canshare.com/fhir/StructureDefinition/copy-to-facility"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ


* ^context.type = #element
* ^context.expression = "ServiceRequest"



* value[x] only Reference(Organization)

