#Author: rmani2005@gmail.com

Feature: floatinteger in KarateAPI

@regression
Scenario: floatinteger function in KarateAPI

* def foo = '10'
* string json = { bar: '#(1 * foo)' }
* match json == '{"bar":10.0}'

@regression
Scenario: Scenario 2 - floatinteger function in KarateAPI


* string json = { bar: '#(parseInt(foo))' }
* match json == '{"bar":10.0}'
