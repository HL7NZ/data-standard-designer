Extension: RequestingFacility
Id: requesting-facility
Description: "The facility that requested the request"

* ^url = "http://canshare.com/fhir/StructureDefinition/requesting-facility"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ


* ^context.type = #element
* ^context.expression = "ServiceRequest"



* value[x] only Reference(Organization)

