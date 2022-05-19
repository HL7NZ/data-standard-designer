Extension: CanPublishReviewerOia
Id: can-publish-reviewer-oia
Description: "If true, the identity of the reviewer can be included in an OIA (Official Information Act) request"


* ^url = $can-publish-reviewer-oia
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft

* ^context.type = #element
* ^context.expression = "QuestionnaireResponse"

* value[x] only boolean

