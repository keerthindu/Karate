Feature: create details

  Background: 
    * url 'https://reqres.in/api'
    * def requestBody = read('classpath:/Data/request1.json')
    * def responseBody = read('classpath:/Data/response1.json')

  Scenario: Using POST API create request
    Given url 'https://reqres.in/api/users'
    And request { "name": "Imran",  "job": "VP"}
    Then method post
    And status 201
    And print response
    And print responseHeaders

  Scenario: Post API - using background
    Given path '/users'
    And request { "name": "Preethi",  "job": "SE"}
    And method post
    And status 201
    And print response
    And def authToken = response
    And print authToken

  Scenario: Post API - using request file
    Given path '/users'
    And request requestBody
    And method post
    And status 201
    And print response
    And match response == { "createdAt": "#ignore","name": "Leela","id": "#string","job": "QA"}

  Scenario: POST API - read response from response1.json
    Given path '/users'
    And request requestBody
    And method post
    And status 201
    And print response
    And def Body = responseBody
    And print Body
    And match response == Body

  Scenario: POST API - set existing request values
    Given path '/users'
    And request requestBody
    And set requestBody.name = 'Malini'
    And method post
    And status 201
    And print response
    And print requestBody
    
