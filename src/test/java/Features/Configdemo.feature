Feature: Config demo

  Background: 
    * url baseURL
    * header Accept = 'application/json'

  Scenario: Config Demo1
    Given print name

  #Simple Get Request
  Scenario: GET Demo1
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response
