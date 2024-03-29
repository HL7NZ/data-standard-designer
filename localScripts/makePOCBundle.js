#!/usr/bin/env node
/**
 * the example bundle

 * */

//let typesToUpload = []

const fs = require('fs');
const axios = require('axios')

let folder = "../fsh-generated/resources/";
let bundle = {resourceType:"Bundle",type:'transaction',entry:[]}
//let serverUrl = 'http://localhost:9199/baseR4'

let serverUrl = 'http://localhost:8080/fhir'

let arFiles = fs.readdirSync(folder);
arFiles.forEach(function(name){
    if (name.indexOf("Questionnaire-") > -1 || name.indexOf("Patient-") > -1 || name.indexOf("SearchParameter-") > -1 || name.indexOf("ValueSet-") > -1) {
        let fullFileName = folder + name;

       // console.log(fullFileName)
        let contents = fs.readFileSync(fullFileName).toString();
        let resource = JSON.parse(contents)
        let entry = {resource:resource}
        entry.request = {method:"PUT",url:`${resource.resourceType}/${resource.id}`}
        bundle.entry.push(entry)

    }
})
       
console.log(bundle)
let contents = JSON.stringify(bundle)
fs.writeFileSync("./POCBundle.json",contents)

//now upload to local server
axios.post(serverUrl,bundle).then(
    function(response) {
        console.log(JSON.stringify(response.data,null,2))
        console.log("Updated server at " + serverUrl)
    }
).catch(function(err){
    console.log(err.code)
})



