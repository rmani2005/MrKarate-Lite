@regression      
Feature: Hello World

  Background:
    Given url baseUrl
    Given path '/api/hello'

@core,regression
  Scenario: Hello world

    When method GET
    Then status 200
    And match $ == "Hello world!"

@smoke
  Scenario: Hello with a param

    Given param name = 'UtsavRavimaniya'
    When method GET
    Then status 200
    And match $ == "Hello UtsavRavimaniya!"
    
 Feature: Hello World

  Background:
    Given url baseUrl
    Given path '/api/hello'

  Scenario: Hello world

    When method GET
    Then status 200
    And match $ == "Hello world!"

  Scenario: Hello with a param

    Given param name = 'Daas'
    When method GET
    Then status 200
    And match $ == "Hello Daas!"
    
  Background:
    * url baseUrl
    * path '/api/hello'

  Scenario: Hello Peter

    * param name = 'Peter'
    * method GET
    * status 200
    * match $ == "Hello Peter!"