Instance: QLungCancer
InstanceOf: Questionnaire
Description: "Questionnaire for Lung Cancer histology request"

* url = "http://clinfhir.com/Questionnaire/lungcancer"
* status = #draft
* name = "LungCancerHistologyRequest"
* title = "A form to capture data to accompany a histology request for lung cancer"

//--------- patient information 
* item[+].linkId = "patinfo"
* item[=].text = "Patient Information"
* item[=].type = #group

* item[=].item[+].linkId = "nhi"
* item[=].item[=].text = "NHI"
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

* item[=].item[+].linkId = "absestos"
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
//* item[=].item[=].answerValueSet = $site-vs

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


Instance: QLungCancerResponse
InstanceOf: QuestionnaireResponse
Description: "Example of questionnaire response"

* status = #completed
* questionnaire = "http://clinfhir.com/Questionnaire/lungcancer"

* item[+].linkId = "nhi"
* item[=].answer[+].valueString = "zzz9999"

* item[+].linkId = "cpn"
* item[=].answer[+].valueString = "x12"

* item[+].linkId = "ss"
* item[=].answer[+].valueCoding = $ss-cs#current

* item[+].linkId = "asbestos"
* item[=].answer[+].valueBoolean = false

* item[+].linkId = "previousCx"
* item[=].answer[+].valueString = "None known"

* item[+].linkId = "previousCancer"
* item[=].answer[+].valueString = "Malignant melanoma left arm in 1997"

* item[+].linkId = "site"
* item[=].answer[+].valueCoding = $site-cs#rul

* item[+].linkId = "resection"
* item[=].answer[+].valueCoding = $resection-cs#wedge

