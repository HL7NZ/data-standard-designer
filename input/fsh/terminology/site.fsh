
CodeSystem:  Site
Id: site
Title: "Smoking Status"

* ^url = $site-cs

* #rul "Right Upper Lobe" 
* #rml "Right Middle Lobe" 
* #rll "Right Lower Lobe" 
* #lul "Left Upper Lobe"
* #lll "Left Lower Lobe"
* #mb "Main Bronchus"

ValueSet : Site
Id: site
Title: "Site and laterality"

* ^url = $site-vs
* codes from system $site-cs
