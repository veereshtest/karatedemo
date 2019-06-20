Feature: verify api for reqres.in apllication

Background:
   * url 'https://reqres.in/api'
   * header Accept = 'application/json'
   
Scenario: verify status code
Given path 'users'
And param page = 2
When method get
Then status 200
And match response.data[*].last_name contains ['Holt']

Scenario Outline: verify Last Name
* def query = { page: <page> }
* print query

Given path 'users'
And params query
When method get
Then status 200
And match response.data[*].last_name contains <name>

Examples:
|page|name|
|1|'Morris'|
|2|'Holt'|






