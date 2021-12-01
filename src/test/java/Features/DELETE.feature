Feature: Delete API Demo

  Background: 
    * url 'https://reqres.in/api'
   

  Scenario: Demo1
    Given path '/users/2'
   
    When method delete
    Then status 204
    Then print response
    Then print responseStatus
    And match responseStatus == 204
    
    
