Logical:        LungModel
Title:          "Model for Lung cancer data"
Description:    "Model for Lung cancer data"
Parent:         Element


* administrative 1..1 BackboneElement "Administrative data"
  * NHI 1..1 identifier "NHI for the patient"
    "Will be in the Patient.identifier element"
  * HPI 1..1 identifier "HPI number of the person making the request"
* clinicalData 1..1 BackboneElement "Clinical information about the request"
  * smokingStatus 0..1 CodeableConcept "Smoking status"
  * smokingStatus from $ss-vs 
  * asbestos 0..1 boolean "Has there been asbestos exposure"
  * previousCytology 0..1 string "Details of previous cytology or biopsies for this tumour"
  * previousTx 0..1 string "Details of previous treatment for this tumour"
  * previousCancer 0..1 string "Any previous cancers"
  * site 1..1 CodeableConcept "Site and laterality"
  * site from $site-vs
  * resection 1..1 CodeableConcept "Nature of the resection"
  * resection from $resection-vs
* specimen 1..1 BackboneElement "Details about the specimen"
  * specLabel 1..1 string "Specimen Label"
  * specReturn 0..1 boolean "Does the patient want the specimen returned"

