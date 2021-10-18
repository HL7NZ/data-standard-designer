
CodeSystem:  SmokingStatus
Id: smoking-status
Title: "Smoking Status"

* ^url = $ss-cs

* #current "current" "The person is currently a smoker"
* #ex "ex" "The person is an ex smoker."
* #never "never" "The person has never smoked."


ValueSet : AliasTypeSmokingStatus
Id: smoking-status
Title: "Smoking Status"

* ^url = $ss-vs
* codes from system $ss-cs
