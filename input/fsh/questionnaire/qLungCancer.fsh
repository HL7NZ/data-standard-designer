Instance: QLungCancer
InstanceOf: Questionnaire
Description: "Questionnaire for Lung Cancer histology request"

* url = "http://clinfhir.com/Questionnaire/lungcancer"
* status = #draft
* name = "LungCancerHistologyRequest"
* title = "A form to capture data to accompany a histology request for lung cancer"
* useContext.code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext.valueCodeableConcept = http://clinfhir.com#structuredPath

//--------- patient information 
* item[+].linkId = "patinfo"
* item[=].text = "Patient Information"
* item[=].type = #group

* item[=].item[+].linkId = "nhi"
* item[=].item[=].text = "NHI"
* item[=].item[=].type = #string

* item[=].item[+].linkId = "fname"
* item[=].item[=].text = "First Name"
* item[=].item[=].type = #string

* item[=].item[+].linkId = "lname"
* item[=].item[=].text = "Last Name"
* item[=].item[=].type = #string

//-----  clinician information
* item[+].linkId = "clinicianinfo"
* item[=].text = "Clinician Information"
* item[=].type = #group

* item[=].item[+].linkId = "cpn"
* item[=].item[=].text = "CPN"
* item[=].item[=].type = #string

//-----  clinical information
* item[+].linkId = "clinicalinfo"
* item[=].text = "Clinical Information"
* item[=].type = #group

* item[=].item[+].linkId = "ss"
* item[=].item[=].text = "Smoking Status"
* item[=].item[=].type = #choice
//* item[=].item[=].answerValueSet = $ss-vs
* item[=].item[=].answerOption[+].valueCoding = $ss-cs#current "current" 
* item[=].item[=].answerOption[+].valueCoding  = $ss-cs#current "ex" 
* item[=].item[=].answerOption[+].valueCoding  = $ss-cs#current "never" 

* item[=].item[+].linkId = "asbestos"
* item[=].item[=].text = "Asbestos exposure"
* item[=].item[=].type = #boolean

* item[=].item[+].linkId = "previousCx"
* item[=].item[=].text = "Details of previous cytology or biopsies for this tumour"
* item[=].item[=].type = #text

* item[=].item[+].linkId = "previousTx"
* item[=].item[=].text = "Details of previous treatment for this tumour"
* item[=].item[=].type = #text

* item[=].item[+].linkId = "previousCancer"
* item[=].item[=].text = "Details of previous cancer diagnosis"
* item[=].item[=].type = #text

* item[=].item[+].linkId = "site"
* item[=].item[=].text = "Site and laterality"
* item[=].item[=].type = #choice
//* item[=].item[=].answerValueSet = $site-vs       //can have answerOption or answerValueSet but not both

* item[=].item[=].answerOption[+].valueCoding = $site-cs#rul "Right Upper Lobe" 
* item[=].item[=].answerOption[+].valueCoding = $site-cs#rml "Right Middle Lobe" 
* item[=].item[=].answerOption[+].valueCoding = $site-cs#rll "Right Lower Lobe" 
* item[=].item[=].answerOption[+].valueCoding = $site-cs#lul "Left Upper Lobe"
* item[=].item[=].answerOption[+].valueCoding = $site-cs#lll "Left Lower Lobe"
* item[=].item[=].answerOption[+].valueCoding = $site-cs#mb "Main Bronchus"

* item[=].item[+].linkId = "resection"
* item[=].item[=].text = "Nature of the resection"
* item[=].item[=].type = #choice
//* item[=].item[=].answerValueSet = $resection-vs

* item[=].item[=].answerOption[+].valueCoding = $resection-cs#wedge "wedge" 
* item[=].item[=].answerOption[+].valueCoding = $resection-cs#segmentectomy "segmentectomy" 
* item[=].item[=].answerOption[+].valueCoding = $resection-cs#bilobectomy "bilobectomy" 
* item[=].item[=].answerOption[+].valueCoding = $resection-cs#lobectomy "lobectomy"
* item[=].item[=].answerOption[+].valueCoding = $resection-cs#pneumonectomy "pneumonectomy"
* item[=].item[=].answerOption[+].valueCoding = $resection-cs#other "Other"


//--------- specimen
* item[+].linkId = "specimen"
* item[=].text = "Specimen Information"
* item[=].type = #group

* item[=].item[+].linkId = "specLabel"
* item[=].item[=].text = "Specimen Label"
* item[=].item[=].type = #string

* item[=].item[+].linkId = "specReturn"
* item[=].item[=].text = "Patient requests specimen return"
* item[=].item[=].type = #boolean


Instance: QLungCancerResponse
InstanceOf: QuestionnaireResponse
Description: "Example of questionnaire response"

* status = #completed
* questionnaire = "http://clinfhir.com/Questionnaire/lungcancer"


* item[+].linkId = "patinfo"

* item[=].item[+].linkId = "nhi"
* item[=].item[=].answer[+].valueString = "zzz9999"



* item[+].linkId = "clinicianinfo"

* item[=].item[+].linkId = "cpn"
* item[=].item[=].answer[+].valueString = "x12"


* item[+].linkId = "clinicalinfo"

* item[=].item[+].linkId = "ss"
* item[=].item[=].answer[+].valueCoding = $ss-cs#current



* item[=].item[+].linkId = "asbestos"
* item[=].item[=].answer[+].valueBoolean = false

* item[=].item[+].linkId = "previousCx"
* item[=].item[=].answer[+].valueString = "None known"

* item[=].item[+].linkId = "previousCancer"
* item[=].item[=].answer[+].valueString = "Malignant melanoma left arm in 1997"

* item[=].item[+].linkId = "site"
* item[=].item[=].answer[+].valueCoding = $site-cs#rul

* item[=].item[+].linkId = "resection"
* item[=].item[=].answer[+].valueCoding = $resection-cs#wedge

