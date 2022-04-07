

### General questions



#### Previous treatment

how detailed will this be? assume just text (Observation) but could also be MedicationAdministration / Procedure

#### Previous cancer

how detailed will this be? assume just text (Observation) but could also be Condition

#### radiology data

how detailed will this be? assume just text (Observation) 

#### TNM

Is there both clinical and pathological TNM

### Observation codes

A number of the elements in the Logical Model are represented by Observations, and a specific Observation.code value is needed to identify each one. The following table lists those elements. Note that this table is manually generated, and so may not match the model from time to time


<table class="table table-bordered">

<tr>
    <th>Element</th>
    <th>Notes</th>
    <th>Code</th>
</tr>

<tr>
    <td>Smoking status</td>
    <td></td>
        <td></td>
</tr>

<tr>
    <td>Asbestos exposure</td>
    <td></td>
        <td></td>
</tr>
<tr>
    <td>Previous Cytology</td>
    <td></td>
        <td></td>
</tr>
<tr>
    <td>Previous Treatment</td>
    <td></td>
        <td></td>
</tr>
<tr>
    <td>Previous cancer</td>
    <td></td>
        <td></td>
</tr>
<tr>
    <td>Radiology data</td>
    <td></td>
        <td></td>
</tr>
<tr>
    <td>Other clinical data</td>
    <td></td>
        <td></td>
</tr>
<tr>
    <td>TNM-Parent (A parent Obs for all TNM data</td>
    <td></td>
        <td></td>
</tr>
<tr>
    <td>TNM-T</td>
    <td></td>
        <td></td>
</tr>
<tr>
    <td>TNM-N</td>
    <td></td>
        <td></td>
</tr>
<tr>
    <td>TNM-M</td>
    <td></td>
        <td></td>
</tr>
<tr>
    <td>TNM group</td>
    <td></td>
        <td></td>
</tr>
<tr>
    <td>Clinical Indication</td>
    <td></td>
        <td></td>
</tr>
<tr>
    <td>neoadjuvantTherapy</td>
    <td>This may be better represented as MedicationStatement resources, in which we'll need a category code to indicate 'Neoadjuvant'</td>
        <td></td>
</tr>
<tr>
    <td>Adjacent organs involved</td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td>Surgical Opinion</td>
    <td></td>
    <td></td>
</tr>


</table>




### ValueSets

Coded elements will all need ValueSets. This table lists ValueSets and urls. (This will be specified by the profiles once that work is complete)

Like the table above, this one is manually generated.

<table class="table table-bordered">

<tr>
    <th>Element</th>
    <th>Notes</th>
    <th>ValueSet url</th>
</tr>

<tr>
    <td>Smoking status</td>
    <td></td>
    <td></td>
</tr>

<tr>
    <td>TNM-Parent </td>
    <td>A parent Observation for all TNM data</td>
    <td></td>
</tr>

<tr>
    <td>TNM-T</td>
    <td></td>
        <td></td>
</tr>
<tr>
    <td>TNM-N</td>
    <td></td>
        <td></td>
</tr>
<tr>
    <td>TNM-M</td>
    <td></td>
        <td></td>
</tr>
<tr>
    <td>TNM group</td>
    <td></td>
        <td></td>
</tr>

<tr>
    <td>Clinical indication</td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td>Type of procedure</td>
    <td>Bronchoscopic, Transthoracic, Frozen section, operative lung / pleura / mediastinum"</td>
    <td></td>
<tr>
    <td>Procedure codes</td>
    <td>The code for the actual procedure</td>
    <td></td>
</tr>
<tr>
    <td>Tumour site</td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td>Resection nature</td>
    <td></td>
    <td></td>
</tr>


</table>



