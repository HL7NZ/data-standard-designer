Extension: ItemDescription
Id: item-description
Description: "Description of the item, to be displayed to the user"


* ^url = $item-description
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ
* ^purpose = "Extra information about the item, for the user."

* ^status = #draft

* ^context.type = #element
* ^context.expression = "Questionnaire.item"

* value[x] only string

