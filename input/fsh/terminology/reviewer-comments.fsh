ValueSet: ReviewerCommentType
Id: reviewer-comment-type
Title: "Comment types entered by a reviewer"
Description: "Identifies which data elements in a QR are reviewer comments rather than data ."

* ^url = $reviewer-comment-type-vs
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* codes from system $reviewer-comment-type-cs


CodeSystem: ReviewerComments
Id: reviewer-comment-type
Description: "Codes to identify what tupe of comment - eg on the clinical section in the form"

* ^url = $reviewer-comment-type-cs

* #clinical "Comments on a clincial section"
* #other "Some other comment"
