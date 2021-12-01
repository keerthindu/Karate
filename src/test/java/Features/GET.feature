Feature: Get API Demo

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read('classpath:Data/getuserequest.json')

  #Simple Get Request
  Scenario: GET Demo1
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

  #Get with Background
  Scenario: GET Demo2
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response

  #Get with path and parameter
  Scenario: GET Demo3
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response

  #Get with Assertions
  Scenario: GET Demo 4
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And match response.data[0].first_name !=null
    And assert response.data.length == 6
    And match response.data[4].id == 11
    And assert response.data[5].last_name == 'Howell'
    
    
    
    
    
    
    
    
    
    
    
    