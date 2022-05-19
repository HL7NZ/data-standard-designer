Extension: Verification
Id: verification
Description: "Notes about validation rules for this element"

* ^url = $verification
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ
* ^purpose = "Needed for the HISO report"
* ^status = #draft

* ^context.type = #element
* ^context.expression = "Questionnaire.item"

* value[x] only string

