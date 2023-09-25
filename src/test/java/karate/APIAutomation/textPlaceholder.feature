#Author: your.rmani2005@gmail.com

Feature: Placeholder in Karate using Replace keyword

@regression
Scenario: Table in KarateAPI
* def text = 'hello <foo> world'
* replace text.foo = 'bar'
* match text == 'hello bar world'


Feature: Placeholder in Karate using toekn & value in table format

@regression
Scenario: Placeholder in Karate using toekn & value in table format
 * def text = 'hello <one> world <two> bye'

* replace text
  | token | value   |
  | one   | 'cruel' |
  | two   | 'good'  |

* match text == 'hello cruel world good bye'

@regression
Scenario: Scenario2 - Placeholder in Karate using toekn & value in table format
* def text = 'hello <one> world ${two} bye'
* def first = 'cruel'
* def json = { second: 'good' }

* replace text
    | token  | value       |
    | one    | first       |
    | ${two} | json.second |

* match text == 'hello cruel world good bye'