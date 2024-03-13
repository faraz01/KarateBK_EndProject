
@SignUpAPI
Feature: SignUp API- creating users for site

Background: Defined URL
    Given url apiURL


Scenario: Sign Up new user
    Given path 'users'
    And request {"user":{"email":"TestSample01@test.com","password":"test1234","username":"TestSample01"}}
    When method Post
    Then status 201
    And match response.user.username == 'TestSample01'
    