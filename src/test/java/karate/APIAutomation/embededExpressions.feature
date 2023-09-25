#Author: your.email@your.domain.com

Feature: Embedded Expression in JSON

@regression
Scenario: Embedded Expression using JSON
Given def user = { name: 'john', age: 21 }
And def lang = 'en'
When def session = { name: '#(user.name)', locale: '#(lang)', sessionUser: '#(user)'  }
Then print session


@regression
Scenario: Embedded Expression using XML
Given def user = <user><name>john</name></user>
And def lang = 'en'
When def session = <session><locale>#(lang)</locale><sessionUser>#(user)</sessionUser></session>
* def foo = { bar: '#("hello " + name)' }
* print foo
Then print session
* def name = 'Manikandan Ravi'
* def temp = 'hello ' + name
* def foo = { bar: '#(temp)' }
* print foo

* def foo = 'a1'
* match foo == '#("a" + 1)'

* param filter = `ORDER_DATE:"${todaysDate}"`
* print filter	


@regression
Scenario: Embedded Expression vs Enclosed Javascript

When def user = { name: 'john', age: 21 }
And def lang = 'en'

* def embedded = { name: '#(user.name)', locale: '#(lang)', sessionUser: '#(user)' }
* def enclosed = ({ name: user.name, locale: lang, sessionUser: user })
* match embedded == enclosed