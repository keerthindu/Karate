Feature: Using call function

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def requestOutput = read('classpath:Data/getresponse.json')

  Scenario: Read  data set
    Given path '/users/4'
    When method GET
    And status 200
    And print response
    #And print requestOutput 
   # And match response == requestOutput[1]
