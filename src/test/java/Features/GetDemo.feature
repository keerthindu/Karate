
Feature: Get multiple data by using ID from external resource

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def requestOutput = read('classpath:Data/getresponse.json')
    * def feature = read('./Data.feature')
    * def result = call feature

  Scenario: Read mulitple data set
    Given path '/users/2'
    When method GET
    And status 200
    And print response
    And print requestOutput 
    And match response == requestOutput[0]
    
    @parallele=false
    Scenario: Read mulitple data set
    Given path '/users/3'
    When method GET
    And status 200
    And print response
    And print requestOutput 
    And match response == requestOutput[1]
    Then print '*************Data read from other feature file Data.feature************',result
    Then def first_name = result.response 
    Then print first_name
