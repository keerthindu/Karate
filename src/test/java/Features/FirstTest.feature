Feature: Karate API Testing

  Scenario: Test a Sample Get API
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    
    Scenario: Test another get
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
