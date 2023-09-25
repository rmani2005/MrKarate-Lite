#Author: rmani2005@gmail.com

    
Feature: A simple Karate test that always or fail passes (with Sanity tag)

@sanity
Scenario: Def declaration and match the variable and fail

    * def foo = 1234
    * def bar = 1234
    * match foo == bar
  
@sanity     
Scenario: BDD format - Def declaration and match the variable and fail

   Given two variables 
   When def foo = 123
   When def bar = 1234567
   And match foo == bar

@regression   
Scenario: String check the 

	Given def color = 'red'
	And def num = 5
	And print color + num
	Then assert color + num = 'red5'

@regression
Scenario: Check the String basics and casting between int and string 
	Given def var1 = 'world'
	When print var1
	And def var1 = 5
	And print var1	
	And print 'This is to print and check the variable ', var1
	And print 'This is to print and check the variable with plus(+) symbol '+ var1

@regression
Scenario: Printing the JSON files
	* def JSONmessage = { foo:'bar', baz:[1,2,3,4,5,6]}
	* print 'Printing the Json message from JSON variables:', JSONmessage
	* print 'Printing the Json message from JSON variables:', JSONmessage

@regression
Scenario: Printing the JSON files in preety method
	* def JSONmessage = { foo:'bar', baz:[1,2,3,4,5,6]}
	* def JSONCat = {name:'Manikandan Ravi', score: [2,5]}
	* print 'Printing the Json message from JSON variables:', JSONmessage
	* print 'Printing the Json message from JSON variables using Pretty:', karate.pretty(JSONmessage)
	* print 'Printing the Json message from JSON variables:', JSONCat
	* print 'Printing the Json message from JSON variables using Pretty:', karate.pretty(JSONCat)
	
	
@regression
Scenario: Native data type
* def cat = { name: 'Billie', scores: [2, 5] }
* assert cat.scores[1] == 5

@regression 
Scenario: JSON traverse and print the values
* def cats = [{name: 'Movue' },{name: 'Pepe'}]
* match cats[1] == {name:'Pepe'}

* def first = cats[0]
* def firstValue = cats[0].name
* match first == { name: 'Movue' }
* print firstValue

@regression
Scenario: XML traverse
Given def cat = <cat><name>Billie</name><scores><score>2</score><score>5</score></scores></cat>
# sadly, xpath list indexes start from 1
Then match cat/cat/scores/score[2] == '5'
# but karate allows you to traverse xml like json !!
Then match cat.cat.scores.score[1] == 5
	