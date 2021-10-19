#!/usr/bin/env node

//Make logical models (as table) from Questionnaires

let fs = require('fs')
let htmlFile = "../input/pagecontent/logicalmodel.md"
let rootPath = "../fsh-generated/resources/"
let server = "home.clinfhir.com" //:8054/baseR4/"
let http = require('http')
let ar = []

fs.readdirSync(rootPath).forEach(function(fileName) {
    console.log(fileName)
    let fullFileName = rootPath + fileName
    if (fileName.startsWith("Questionnaire-")){
       

        let contents = fs.readFileSync(fullFileName, {encoding: 'utf8'});

        let Q = JSON.parse(contents)
        ar.push(`\n### ${Q.name} \n`)
        ar.push("<table class='table table-bordered'>")
        ar.push("<tr><th>Name</th><th>Type</th><th>Mult</th><th>Details</th></tr>")
        Q.item.forEach(function(parent){
            ar.push("<tr>")
            ar.push(`<td><strong>${parent.text}</strong></td>`)
            ar.push(`<td></td>`)
            ar.push(`<td>${makeMult(parent)}</td>`)
            ar.push(`<td>${getDescription(parent)}</td>`)
            ar.push("</tr>")
            if (parent.item) {
                parent.item.forEach(function(child){
                    ar.push("<tr>")
                    ar.push(`<td>${child.text}</td>`)
                    ar.push(`<td>${child.type}</td>`)
                    ar.push(`<td>${makeMult(child)}</td>`)
                    ar.push(`<td>${getDescription(child)}</td>`)
                    ar.push("</tr>")
                })
            }
        })


        ar.push("</table>")
        //ar.push("<br/>")

    }
})

console.log(ar)
fs.writeFileSync(htmlFile,ar.join('\n'))

function makeMult(item) {
    let mult = ""
    if (item.required) {
        mult = "1.."
    } else {
        mult = "0.."
    }

    if (item.repeats) {
        mult += "*"
    } else {
        mult += "1"
    }
    return mult
}

function getDescription(item) {
    let extUrl = "http://clinfhir.com/structureDefinition/q-item-description"
    let v = ""
    if (item.extension) {
        item.extension.forEach(function (ext) {
            if (ext.url == extUrl ) {

                v = ext.valueString
            }
        })
    }
    return v
}