
### LungCancerHistologyRequest 

<table class='table table-bordered'>
<tr><th>Name</th><th>Type</th><th>Mult</th><th>Details</th></tr>
<tr>
<td><strong>Patient Information</strong></td>
<td></td>
<td>0..1</td>
<td></td>
</tr>
<tr>
<td>NHI</td>
<td>string</td>
<td>0..1</td>
<td></td>
</tr>
<tr>
<td>First Name</td>
<td>string</td>
<td>0..1</td>
<td></td>
</tr>
<tr>
<td>Last Name</td>
<td>string</td>
<td>0..1</td>
<td></td>
</tr>
<tr>
<td><strong>Clinician Information</strong></td>
<td></td>
<td>0..1</td>
<td></td>
</tr>
<tr>
<td>CPN</td>
<td>string</td>
<td>0..1</td>
<td></td>
</tr>
<tr>
<td><strong>Clinical Information</strong></td>
<td></td>
<td>0..1</td>
<td></td>
</tr>
<tr>
<td>Smoking Status</td>
<td>choice</td>
<td>0..1</td>
<td></td>
</tr>
<tr>
<td>Asbestos exposure</td>
<td>boolean</td>
<td>0..1</td>
<td></td>
</tr>
<tr>
<td>Details of previous cytology or biopsies for this tumour</td>
<td>text</td>
<td>0..1</td>
<td></td>
</tr>
<tr>
<td>Details of previous treatment for this tumour</td>
<td>text</td>
<td>0..1</td>
<td></td>
</tr>
<tr>
<td>Details of previous cancer diagnosis</td>
<td>text</td>
<td>0..1</td>
<td></td>
</tr>
<tr>
<td>Site and laterality</td>
<td>choice</td>
<td>0..1</td>
<td></td>
</tr>
<tr>
<td>Nature of the resection</td>
<td>choice</td>
<td>0..1</td>
<td></td>
</tr>
<tr>
<td><strong>Specimen Information</strong></td>
<td></td>
<td>0..1</td>
<td></td>
</tr>
<tr>
<td>Specimen Label</td>
<td>string</td>
<td>0..1</td>
<td></td>
</tr>
<tr>
<td>Patient requests specimen return</td>
<td>boolean</td>
<td>0..1</td>
<td></td>
</tr>
</table>

### TestForm 

<table class='table table-bordered'>
<tr><th>Name</th><th>Type</th><th>Mult</th><th>Details</th></tr>
<tr>
<td><strong>Patient Information</strong></td>
<td></td>
<td>0..1</td>
<td>information about the patient</td>
</tr>
<tr>
<td>NHI</td>
<td>string</td>
<td>0..1</td>
<td>The National Health Identifier</td>
</tr>
<tr>
<td>First name</td>
<td>string</td>
<td>0..1</td>
<td>The patients first name</td>
</tr>
<tr>
<td>Last name</td>
<td>string</td>
<td>0..1</td>
<td>The patients last name</td>
</tr>
</table>