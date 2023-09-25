#Author: rmani2005@gmail.com

Feature: YAML in KarateAPI

@regression
Scenario: YAML in KarateAPI
* def bar = read('data.yaml')
* print bar
* text foo =
  """
  name: John
  input:
    id: 1
    subType: 
      name: Smith
      deleted: false
  """
# yaml to json type conversion  
* yaml YAMLtoJson = foo
* match YAMLtoJson ==
  """
  {
    name: 'John',
    input: { 
      id: 1,
      subType: { name: 'Smith', deleted: false }    
    }
  }
  """
  
  * text foo =
    """
    name,type
    Billie,LOL
    Bob,Wild
    """
* csv bar = foo
* match bar == [{ name: 'Billie', type: 'LOL' }, { name: 'Bob', type: 'Wild' }]