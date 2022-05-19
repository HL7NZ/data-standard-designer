Profile:        CsQuestionnaire
Parent:         Questionnaire
Id:             cs-questionnaire
Title:          "Questionnaire used in Data Standard"
Description:    "The elements and extensions used by the Data Standard tooling"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/spath-observation-ss"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Questionnaire profile</div>"

* ^version = "0.1.0"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ
//elements that have been removed

* derivedFrom 0..0
* experimental 0..0
* subjectType 0..0
* useContext 0..0
* jurisdiction 0..0



//don't allow modifier extensions
* modifierExtension 0..0

//root level extensions
* extension contains
    $can-publish-reviewer named can-publish-reviewer 0..1 and
    $can-publish-reviewer-oia named can-publish-reviewer-oia 0..1 and 
    $attachment named attachment 0..*


* item.extension contains
    $extract-notes named extract-notes 0..1 and
    $usage-notes named usage-notes 0..1 and
    $verification named verification 0..1 and
    $notes named notes 0..1 and
    $source-standard named source-standard 0..1 and
    $hiso-class named hiso-class 0..1 and
    $hiso-length named hiso-length 0..1 and
    $hiso-dt named hiso-dt 0..1 and
    $hiso-layout named hiso-layout 0..1 and
    $column named column 0..1 and
    $column-count named column-count 0..1 and
    $item-description named item-description 0..1 

