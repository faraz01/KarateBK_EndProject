
@SignUpAPI
Feature: SignUp API- creating users for site

Background: Precondition
    Given url apiURL




Scenario: Sign Up new user
    Given def userData = {"user":{"email":"Testuser01@test.com","username":"Testuser01"}}
    Given path 'users'
    And request {"user":{"email":"Testuser01@test.com","password":"test1234","username":"Testuser01"}}
    When method Post
    Then status 201
    And match response.user.username == 'Testuser01'
    
    Given path 'articles'
    And request {"article": {"tagList": ["Tags", "wipro", "wilearn"], "title": "Udemy_Wilearn","description": "Test","body": " through-script-karate"}}
    When method Post
    Then status 201
    * def  articleId = response.article.slug