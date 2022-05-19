Extension: ExtractNotes
Id: extract-notes
Description: "Notes on extracting item contents into FHIR resources by the Forms Receiver"


* ^url = $extract-notes
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^purpose = "Used when deriving FHIR resources from information in the Questionnaire"
* ^status = #draft

* ^context.type = #element
* ^context.expression = "Questionnaire.item"

* value[x] only string

