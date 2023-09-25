#Author: rmani2005@gmail.com

Feature: JavaScript function in KarateAPI

@regression
Scenario: JavaScript function
* def fnn = function(title, name) { return 'Hello ' + title + ' ' + name }
* print fnn('Mr.', 'Manikandan Ravi')
* assert fnn('Mr.', 'Manikandan Ravi') == 'Hello Mr. Manikandan Ravi' 


@regression
Scenario: JavaScript function in var defenition

* def dateStringToLong =
  """
  function(s) {
    var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
    var sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
    return sdf.parse(s).time; // '.getTime()' would also have worked instead of '.time'
  } 
  """
* assert dateStringToLong("2016-12-24T03:39:21.081+0000") == 1482550761081

* def convertthedatetostring = 
 """
 function(date){
 	var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
  var sdf=new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
  
 return sdf.parse(date).getTime();
 }
 """
 
* print (convertthedatetostring("2016-12-24T03:39:21.081+0000"));