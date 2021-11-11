Logical:        LungModel
Title:          "Model for Lung cancer data"
Description:    "Model for Lung cancer data"
Parent:         Element

* ^url = "http://clinfhir.com/StructureDefinition/LungModel"

* patient 1..1 BackboneElement "Patient data"
  * NHI 1..1 identifier "NHI for the patient"
    "Will be in the Patient.identifier element"
  * familyName 0..1 string "Family name"
   // * ^mapping.map = "Patient.name.family"
  * givenName 0..* string "Given (first) names"
  * birthDate 0..1 date "Date of Birth"
  * gender 0..1 code "Gender"
  * ethnicity 0..* CodeableConcept "Ethnicities (up to 6). Text element available if not coded"
* administrative 1..1 BackboneElement "Administrative data"
  * identifier 0..1 Identifier "Client identifier for the request (not an integer)"
  * requestDate 1..1 dateTime "The date that the request was made"
  * principleClinician 0..1 Identifier "The HPI of the main clinician looking after the patient" //todo
  * requestor 1..1 Identifier "HPI number of the person making the request"
    "The bundle will contain a Practitioner resource for the patient, so may include name, etc."
  * copyTo 0..* Identifier "HPI numbers for people to whom a copy should be sent"   //todo
* clinicalData 1..1 BackboneElement "Clinical information about the request"
  * smokingStatus 0..1 CodeableConcept "Smoking status"
  * smokingStatus from $ss-vs 
  * asbestos 0..1 boolean "Has there been asbestos exposure"
  * previousCytology 0..1 string "Details of previous cytology or biopsies for this tumour"
    "If there is no previous cytology, leave blank. This applies to all missing data. Could have a boolean if need to be explicit."
  * previousTx 0..1 string "Details of previous treatment for this tumour"
  * previousCancer 0..1 string "Any previous cancers"
  * radiologyData 0..1 string "Any other relevant rediologic information"
  * otherClinicalData 0..1 string "Any other relevant information"
  * TNM 0..1 BackboneElement "TNM Classification"   //note http://hl7.org/fhir/us/mcode/StructureDefinition-mcode-tnm-clinical-stage-group.html 
    * T-stage 1..1 code "Clinical T (Tumour) stage" 
    * N-stage 1..1 code "Clinical N (Nodes) stage" 
    * M-stage 1..1 code "Clinical M (Metastasis) stage" 
    * group 1..1 code "Clinical group"
    * edition 1..1 code "Edition of TNM used"
    * date 1..1 date "Date evaluation done"
  * indication 0..1 CodeableConcept "Clinical indication ?for procedure"
  * neoadjuvantTherapy 0..* BackboneElement "Information about therapies prior to procedure"
    * administered 0..1 boolean "Whether therapy was administered"
    * details 0..0 string "Details of therapy"
* procedure 0..1 BackboneElement "Details of the procedure performed"
  * type 0..1 CodeableConcept "Type of procedure - Bronchoscopic, Transthoracic, Frozed section, operative lung / pleura / mediastinum"
  * code 0..1 CodeableConcept "Specific procedure."
  * adjacentOrgans 0..1 BackboneElement "Are adjacent organs involved"
    * involved 0..1 boolean "Whether adjacent organs were involved"
    * details 0..1 string "Details of involvement"
  * surgicalOpinion 0..1 BackboneElement "Surgeon's opinion of local residual tumour post procedure"
    * residual 0..1 CodeableConcept "Whether residual is left behind"
    * notes 0..1 string "Notes on residual tumour"
* tumour 1..* BackboneElement "Data about the tumour. ?Can there be more than one?"
  * site 1..1 CodeableConcept "Where the tumour is located"
  * biopsy 1..* BackboneElement "Details of the biopsies"
    * site 1..1 CodeableConcept "Site and laterality"
    * site from $site-vs
    * resection 1..1 CodeableConcept "Nature of the resection"
    * resection from $resection-vs
  * specimen 1..1 BackboneElement "Details about the specimen"
    * specLabel 1..1 string "Specimen Label"
  //  * ^mapping.map = "Specimen.container.description"
    * specReturn 0..1 boolean "Does the patient want the specimen returned"     
    //* ^mapping.map = "Specimen.extension"
* image 0..* BackboneElement "Associated images"
  * image 1..1 Attachment "An image - photographic / hand drawn"
  * notes 0..1 string "Notes about the image"



/* Notes

TNM staging http://hl7.org/fhir/us/mcode/StructureDefinition-mcode-tnm-clinical-stage-group.html 

*/

/*
Mapping:  LMToBundle
Source:   http://clinfhir.com/StructureDefinition/LungModel
Target:   "http://clinfhir.com/Bundle"

* patient -> "Patient"

*/