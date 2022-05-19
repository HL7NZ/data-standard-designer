Extension: CanPublishReviewer
Id: can-publish-reviewer
Description: "If true, the identity of the reviewer can be published"


* ^url = $can-publish-reviewer
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft

* ^context.type = #element
* ^context.expression = "QuestionnaireResponse"

* value[x] only boolean

