Feature: Data Creation

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def projectPath = karate.properties['user.dir']
   # * def expectedOutput = read("response1.json")
    #* def expectedOutput = read("request1.json")
    #* def expectedOutput = read(resPath)

  #Simple POST request - Demo 1
  Scenario: Post API Demo
    Given url 'https://reqres.in/api/users'
    And request {  "name": "Indu", "job": "SDET" }
    Then method POST
    Then status 201
    And print response
    And print responseHeaders

  #POST with Background - Demo 2
  Scenario: Post API using Background
    Given path '/users'
    And request {  "name": "Keerthi", "job": "Developer" }
    Then method POST
    Then status 201
    And print response
    And print responseHeaders

  #POST with assertion - Demo 3
  Scenario: Post API using Assertions
    Given path '/users'
    And request {  "name": "Keerthi", "job": "Developer" }
    Then method POST
    Then status 201
    And print response
    And match response == { "createdAt": "#ignore", "name": "Keerthi", "id": "#string", "job": "Developer"}

  #POST with read response from json file - Demo 4
  Scenario: Post API using read response from json files
    Given path '/users'
    And request {  "name": "Lakshmi", "job": "HR" }
    Then method POST
    Then status 201
    And print response
    #  And match response == { "createdAt": "#ignore", "name": "Lakshmi", "id": "#string", "job": "HR"}
    And def expectedOutput = read("response1.json")
    And print responseStatus
    And match $ == expectedOutput

  #POST with read request body from json file - Demo 5
  Scenario: Post API using read request body from json files
    Given path '/users'
    And print projectPath
    And def filePath = projectPath+'/src/test/java/Data/request1.json'
    And print filePath
    And def requestBody = filePath
    And request requestBody
    Then method POST
    Then status 201
    And print response
    #And def filePath = projectPath+'/src/test/java/Data/response1.json'
    #And def expectedOutput = filePath
    #And match response == { createdAt: "#ignore", name: "Lakshmi", id: "#string", job: "HR"}
    And def expectedOutput = read("response1.json")
    And print responseStatus

  #POST with read response from json file - Demo 6
  Scenario: Post API using set requestfrom json files
    Given path '/users'
    And print projectPath
    And def filePath = projectPath+'/src/test/java/Data/request1.json'
    And print filePath
    And def requestBody = filePath
    And set requestBody.job = 'engineer'
    And request requestBody
    Then method POST
    Then status 201
    And print response
    And def expectedOutput = read("response1.json")
    And print responseStatus
    And match $ == expectedOutput
    
    Scenario: Post API to set values
    
    Given path '/users'
    #And def expectedreq = projectPath+'/src/test/java/Data/request1.json'
    And def req = {"name": "Indu", "job": "Admin"}
    And set req.name = "Keerthi"
    Then method POST
    Then status 201
    And print response
    And print responseHeaders
    And print responseStatus
   
