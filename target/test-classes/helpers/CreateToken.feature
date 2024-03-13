Feature: Create Token

Scenario: Create Token

Given url apiURL
Given path 'users/login'
#And request { "user":{"email": "afaraaz@gmail.com","password": "test123"}}

And request { "user":{"email": "#(username)","password": "#(userpassword)"}}
When method Post
Then status 200
* def authToken = response.user.token 

