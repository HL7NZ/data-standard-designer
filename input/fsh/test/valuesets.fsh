ValueSet: Vs_test1
Id: vs-test1
Title: "Test 1 for usecontext lookup"
Description: "Test 1 for usecontext lookup - cT for bowel concer"

// indicate that this ValueSet is for cT
* ^useContext[+].code.code = #valueset-use
* ^useContext[=].code.system  =  http://canshare.co.nz/CodeSystem/vs-lookup-codes
* ^useContext[=].valueCodeableConcept = $snomed#ct


// indicate that this VS is for bowel cancer
* ^useContext[+].code.code = #valueset-tumour-type
* ^useContext[=].code.system  =  http://canshare.co.nz/CodeSystem/vs-lookup-codes
* ^useContext[=].valueCodeableConcept = $snomed#bowel-cancer

* include codes from system http://snomed.info/sct where concept is-a #363787002


ValueSet: Vs_test2
Id: vs-test2
Title: "Test 2 for usecontext lookup"
Description: "Test 2 for usecontext lookup - cT for breast"

// indicate that this ValueSet is for cT
* ^useContext[+].code.code = #valueset-use
* ^useContext[=].code.system  =  http://canshare.co.nz/CodeSystem/vs-lookup-codes
* ^useContext[=].valueCodeableConcept = $snomed#ct


// indicate that this VS is for breast cancer
* ^useContext[+].code.code = #valueset-tumour-type
* ^useContext[=].code.system  =  http://canshare.co.nz/CodeSystem/vs-lookup-codes
* ^useContext[=].valueCodeableConcept = $snomed#breast-cancer


* include codes from system http://snomed.info/sct where concept is-a #363787002