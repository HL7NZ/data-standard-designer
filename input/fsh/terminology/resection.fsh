
CodeSystem:  Resection
Id: resection
Title: "Nature of the resection"

* ^url = $resection-cs

* #wedge "wedge" 
* #segmentectomy "segmentectomy" 
* #bilobectomy "bilobectomy" 
* #lobectomy "lobectomy"
* #pneumonectomy "pneumonectomy"
* #other "Other"

ValueSet : Resection
Id: resection
Title: "Nature of the resection"

* ^url = $resection-vs
* codes from system $resection-cs
