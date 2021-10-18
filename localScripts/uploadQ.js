#!/usr/bin/env node

//https://nodejs.dev/learn/make-an-http-post-request-using-nodejs

let fs = require('fs')
let rootPath = "../fsh-generated/resources/"
let server = "home.clinfhir.com" //:8054/baseR4/"
let http = require('http')

fs.readdirSync(rootPath).forEach(function(fileName) {
    console.log(fileName)
    let fullFileName = rootPath + fileName
    if (fileName.startsWith("Questionnaire-")){
        console.log('Uploading ' + fullFileName)

        let contents = fs.readFileSync(fullFileName, {encoding: 'utf8'});

        let resource = JSON.parse(contents)
        let id = resource.id

        const data = new TextEncoder().encode(resource)

        const options = {
            hostname: server,
            port: 8054,
            path: '/baseR4/Questionnaire/' + id,
            method: 'PUT',
            headers: {
              'Content-Type': 'application/json',
              'Content-Length': contents.length
            }
          }
          
          const req = http.request(options, res => {
            console.log(`statusCode: ${res.statusCode}`)
          
            res.on('data', d => {
              //process.stdout.write(d)
            })
          })
          
          req.on('error', error => {
            console.error(error)
          })
          
          req.write(contents)
          req.end()



    }
})