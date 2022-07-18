### Data Standard Designer


#### Introduction
The Structured Pathology workstream within the CanShare programme of work involves the creation of a number of different data standards to represent the structured information in the request and report for pathological examination of specimens removed in diagnostic procedures.

To facilitate the process of creating those Data Standard models, and especially the review process around them, tooling was created to help create the models, generate a sample User Interface through which the models could be viewed as a form. In addition, there are functions developed to capture reviewer comments and record their disposition by the Data Standard developers

#### Target audience
This guide documents the artifacts used by the designer including:

* The profile on the Questionnaire resource which contains definition of a single standard
* Extension definitions for the extensions used
* Some terminology artifacts (CodeSystem, ValueSets) for custom terminology

Note that the standards developed during this process describe the data elements within the standard - not the mechanism by which information can be exchanged between systems (This is described in the StructuredPathology guide). 

Many, but not all, of the data elements are coded with a SNOMED code - this is a work in progress.

#### Tooling

Custom tooling has been developed to build and present the Data Standards. There is a publically available [launch page](http://canshare.clinfhir.com) for the tooling. This has lists of the standards under development and approved, with various representations of the standard, including an example User Interface form generated from the standard. 

This form can also be used to collect user feedback on the form contents which is collated by the tooling and reviewed by the authors. The feedback and disposition is also displayed for each standard.

#### Data standard structure

Each standard has a defined structure:

* There are any number of sections (demographics, admin, clinical etc)
* Each section can contain any number of items. Items can either be:
    * A grouping item which can contain any number of child items - but not nested groups
    * A data item representing a single element. This can be any of the supported datatypes, including coded elements. Generally these will be SNOMED codes.

Items that have a coded value can either be represented as a fixed list within the standard, or a ValueSet where the standard indicates the canonical url of the ValueSet which is hosted on a terminology server - which will be the national terminology server once that is available.

The standard supports 'dependant' items - items that are available depending on the value of other items. For example, a common pattern is to have a list of possible values for an element including an 'other' value. When the 'other' value is selected, there is the option to enter the value directly. This is rendered by the tooling as a drop-down list, and a text box displayed when 'other' is selected.

#### Data standard representation

The standard is represented internally as a FHIR [Questionnaire](http://hl7.org/fhir/questionnaire.html) resource, with a number of [extensions](extensions.html) for specialized purposes. 

From this representation, other summaries can be generated for different purposes - such as the [HISO](https://www.health.govt.nz/about-ministry/leadership-ministry/expert-groups/health-information-standards-organisation) format, which is currently a spreadsheet and document. However, from the perspectitve of an implementer, the Questionnaire has all the information needed and can also be used to render a User Interface directly, if the application supports that ability.

Note that it is not required to use the Questionnaire for rendering - an application can use the information within it and use it's own mechanisms to render the form. This is explored in a bit more detail in [this post](https://fhirblog.com/2022/01/31/fhir-forms-theory-and-background/).

The Data Standards currently available are listed on [this page](http://canshare.clinfhir.com)

*Question: Do we also wish to include the Q for each standard in the IG? It does mean a manual update process when a standard is approved*


#### Links
[List of Data Standards](http://canshare.clinfhir.com/frontPage.html)
