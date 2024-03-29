### ValueSets

These are ValueSets that have been defined in this guide for coded elements. 

Each ValueSet resource has a globally unique url (the [Canonical](http://hl7.org/fhir/references.html#canonical) url) that is used to unambiguously identify it. 
This url generally should resolve to the to the FHIR ValueSet resource, though the infrastructure 
to support this is not yet in place. There's a [specific note](http://hl7.org/fhir/valueset.html#ident) in the spec on ValueSet identification.

The [FHIR spec](http://hl7.org/fhir/terminology-module.html) has much more detail on the use of Terminology in FHIR.


<table class='table table-bordered table-condensed'>
<tr><th>ValueSet</th><th>Purpose</th><th>Canonical url</th></tr>
<tr><td width='20%'><a href='ValueSet-canshare-oe.html'>Observable Entity hierarchy</a></td><td><p>Observable Entity hierarchy</p></td><td>http://fhir.org.nz/ig/datastandarddesigner/ValueSet/canshare-oe</td></tr>
<tr><td width='20%'><a href='ValueSet-reviewer-comment-type.html'>Comment types entered by a reviewer</a></td><td><p>Identifies which data elements in a QR are reviewer comments rather than data .</p></td><td>http://clinfhir.com/ValueSet/review-comment</td></tr>
</table>
<br/><br/>
### CodeSystems

These are code systems that have been defined in this guide. They define specific concepts that are included in ValueSets. It is preferable to use an international code system such as SNOMED, ICD or LOINC - but this is not always possible.

Each CodeSystem resource has a globally unique url (the canonical url) that is used to unambiguously identify it. The url generally refers to a description of the codesystem, rather than to the FHIR CodeSystem resource.

The [FHIR spec](http://hl7.org/fhir/terminology-module.html) has much more detail on the use of Terminology in FHIR

<table class='table table-bordered table-condensed'>
<tr><th>CodeSystem</th><th>Purpose</th><th>Canonical Url</th></tr>
<tr><td width='20%'><a href='CodeSystem-reviewer-comment-type.html'>undefined</a></td><td><p>Codes to identify what tupe of comment - eg on the clinical section in the form</p></td><td>http://clinfhir.com/cs/review-comment</td></tr>
</table>