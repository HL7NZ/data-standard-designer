Instance: spSupportingInfoQr
InstanceOf: SearchParameter
Description: "A search request that returns the supportinginfo QR associated with a SR"

* url = "http://canshare.co.nz/fhir/SearchParameter/spSupportingInfo"
* name = "ServiceRequestSupportingInfo"
* status = #active
* description = "A search request that returns the supportinginfo QR associated with a SR"
* code = #supportingInfo
* base = #ServiceRequest
* type = #reference
* expression = "ServiceRequest.supportingInfo"
//* target = #QuestionnaireResponse