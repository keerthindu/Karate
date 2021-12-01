@debug
Feature: PUT API Demo

  Background: 
    * url 'https://reqres.in/api'
    * def requestBody = read('classpath:/Data/request1.json')

  Scenario: Demo1
    Given path '/users/2'
    And request requestBody
    When method put
    Then status 200
    Then print response
    
    
