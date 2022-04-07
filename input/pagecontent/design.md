
### Bundle design

Overall, the bundle represents all the data collected for the request in FHIR resources. The resource types used include

Patient - the 

Composition 

The composition resource is used to give structure to the 



The bundle is structured as a transaction, which means that when applied to the root of a server as a transaction, all the resources will be extracted from the bundle and saved directly on the server. They can subsequently be extracted individually as required through the usual RESTful interface. See the queries section below for sample queries.

Note that this design places much of the complexity on the client as the bundle is quite complicated. If this proves overly difficult for the client (at the least they should use one of the client libraries) then an alternative architecture is for the client to create a QuestionnaireResponse resource, and have the conversion from QR -> Bundle performed on the server or some intermediate mechanism such as an Integration Engine.

Regardless, the bundle creating application should make extensive use of the validation services provided by the FHIR communicate (eg $validate) - initially using just the core resource profiles, then the specific ones that will be created for the IG.


### Queries

Todo confirm patterns of use

#### ServiceRequest

Current Service requests for a patient



