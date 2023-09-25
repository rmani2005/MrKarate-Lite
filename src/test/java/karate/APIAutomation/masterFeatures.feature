#Author: rmani2005@gmail.com

@master
@core
@regression

Feature: This is a master feature file which have all the KArateAPI concepts using reqrest.in API resource
  I want to use this template for my feature file

Background:
	* url 'https://reqres.in/'
 	* def baseURL = 'https://reqres.in/'

 	* configure report = { showLog: true, showAllSteps: true }
 	
  @smoke
  @regressionChecking
  @mani
  Scenario: Checing the Site is reachable by iusing the Get method and response as 200 and OK
    Given url 'https://reqres.in/'
    And path 'api/users'
    When param page = 2
    And method GET
    Then status 200
 		And print "Site is up and running"
 		And print response
 
  @smoke
  @regressionChecking
  @GETMethod
  Scenario: Checking the Site is reachable by iusing the Get method and response as 200 and valdiating the response
    And path 'api/users'
    When path '7'
    And method GET
    Then status 200       #Status Code 200-ok, 404 - issue, 400 - issue, 500 - issue
 		And print "Site is up and running"
 		And print response
 		And print karate.pretty(response)
    * def responseJson =
    """
			     {
			  "data": {
			    "id": 7,
			    "email": "michael.lawson@reqres.in",
			    "first_name": "Michael",
			    "last_name": "Lawson",
			    "avatar": "https://reqres.in/img/faces/7-image.jpg"
			  },
			  "support": {
			    "url": "https://reqres.in/#support-heading",
			    "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
			  }
			}
			"""
    And match responseJson.data.id == response.data.id
    And match responseJson == response
 
  @regressionChecking
  @GETMethod
  Scenario: Testing the GET method with 404 error as return
  #Given url baseURL + '/api/users'
  #* configure headers = { 'Content-Type': 'application/xml' }
  * path '100'
  * method get
  * status 404
  * print 'This user is not available'
  
  #----Running good till here
  
  @regression
  @GETMethod
  Scenario: Testing the POST method with url, Background, resources, Param, header, Match and Assert
  Given url baseURL + '/api/users'
  * configure headers = { 'Content-Type': 'application/json' }
  #* configure headers = { 'Content-Type': 'application/xml' }
  * def jsonCreateUser = 
  """
  {
    "name": "Manikandan Ravi",
    "job": "DevOps Engineer"
	}
  """
  * def jsonRequest = 
  """
  {
  	emp:[
  			{empID:'',empName:'',empDepart:''},
  			{empID:'',empName:'',empDepart:''},
  			empID:'',empName:'',empDepart:''}
  	]
  }
  """
  * request jsonCreateUser
	* method POST
	* status 201
  * print response
  * print 'Newly created User ID is: '
  * print response.id
  * match jsonCreateUser.name == response.name
  * assert jsonCreateUser.name == response.name
  * print response.createdAt   
  
  
  @regression
  @GETMethod
  Scenario: Testing the POST method with header amd loading the json file as request and validate the response
  Given url baseURL + '/api/users'
  #Given request read('my-json.json')
  
  * configure headers = { 'Content-Type': 'application/json' }
  #* configure headers = { 'Content-Type': 'application/xml' }
  #And header Content-Type = 'text/csv' 
	#And header Content-Type = 'text/html'
 	#Given header Accept = 'application/json'
 	
  * json jsonCreateUser = read('createUser.json')
  #* def payload = read('file:target/large.xml')
  * print karate.pretty(jsonCreateUser)
  
  * request jsonCreateUser
	* method POST
	
	#The HTTP verb - get, post, put, delete, patch, options, head, connect, trace.
	#And request karate.readAsString('classpath:my.csv')
	* status 201
  * print response
  * print 'Newly created User ID is: '
  * print response.id
  #* match jsonCreateUser.name == response.name
  * print response.createdAt   
  
  
  @regression
  @GETMethod
  Scenario: Testing the POST method with header amd loading JSON file in header or before header(Given Block)
  Given url baseURL + '/api/users'
  * json jsonCreateUser = read('createUser.json') 
  When request read('createUser.json') 
  * configure headers = { 'Content-Type': 'application/json' }

	* method POST
	#The HTTP verb - get, post, put, delete, patch, options, head, connect, trace.
	#And request karate.readAsString('classpath:my.csv')

	* status 201
  * print response
  * print 'Newly created User ID is: '
  * print response.id
  * match jsonCreateUser.name == response.name
  * assert jsonCreateUser.name == response.name
  * print response.createdAt   
  
  
  @regression
  @GETMethod
  
  Scenario: Testing the POST method with header amd loading JSON file and change the user name and designation according 
  Given url baseURL + '/api/users'
  * configure headers = { 'Content-Type': 'application/json' }
  #* json jsonCreateUser = read('createUser.json')
  #* def payload = read('file:target/large.xml')
  #* print karate.pretty(jsonCreateUser)
  * table jsonCreateUser 
  		| name | job |
  		| 'Manikandand Ravi' | 'DevOps Engineer'|
  #		| 'Priya Mani' | 'Data Scientist' |
  #		| 'Utsav Ravimanya M' | 'Scientist' |
  #		| 'Inbav Ravimanya M' | 'Artist' |
  * print jsonCreateUser
  * request jsonCreateUser
  
	* method POST
	#The HTTP verb - get, post, put, delete, patch, options, head, connect, trace.
	#And request karate.readAsString('classpath:my.csv')
	* status 201
  * print response
  * print 'Newly created User ID is: '
  * print response.id
  * match jsonCreateUser.name == response.name
  * assert jsonCreateUser.name == response.name
  * print response.createdAt   
  
  @currentRun
 @regression
  Scenario: OAUTH and OAUTH2.0 http://brentertainment.com/oauth2
 
* url 'http://brentertainment.com/oauth2/lockdin'
* path 'token'
* form field grant_type = 'password'
* form field client_id = 'demoapp'
* form field client_secret = 'demopass'
* form field username = 'demouser'
* form field password = 'testpass'
* method post
* status 200

* def accessToken = response.access_token

* path 'resource'
* header Authorization = 'Bearer ' + accessToken
# * param access_token = accessToken
* method get
* status 200