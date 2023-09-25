#Author: rmani2005@gmail.com

@master
@core
@regression

Feature: This is a feature to check my bio site up and running - https://manikandanravi.in/api/hello

Background:
	* url 'https://manikandanravi.in/api/'
 	* def baseURL = 'https://manikandanravi.in/api/'
 	* configure report = { showLog: true, showAllSteps: true }
 	
  @smoke
  @regressionChecking
  @mani
  Scenario: Checking the Site is reachable by iusing the Get method and response as 200 and OK
    Given path 'hello'
    When method GET
    Then status 200
 		And print response
 		And print karate.pretty(response)
 		And match response.name == "John Doe"
      
  @smoke
  @currentRun
  @mani
  Scenario: Checking the Site is reachable by iusing the Get method and response as 200 and OK
    Given path 'hello'
    When method GET
    Then status 200
 		And print response
 		And print karate.pretty(response)
 		And match response.name == "John Doe"
      
         