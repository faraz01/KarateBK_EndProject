

Feature: SignUp API- creating users for site

Background: Preconditions
    Given url apiURL



@SignUpAPI
Scenario: Sign Up new user
    Given def userData = {"email":"Testuser007@test.com","username":"Testuser007"}
    Given path 'users'
    # And request {"user":{"email":#('Test'+userData.email),"password":"test1234","username":#('User'+userData.username)}}
    
    And request
    """
{
    "user": {
        "email": #(userData.email),
        "password": "test1234",
        "username": #(userData.username)
    }
}

    """
    
    When method Post
    Then status 201
    # And match response.user.username == #('User'+userData.username)
    
    # Given path 'articles'
    # And request {"article": {"tagList": ["Tags", "wipro", "wilearn"], "title": "Udemy_Wilearn","description": "Test","body": " through-script-karate"}}
    # When method Post
    # Then status 201
    # * def  articleId = response.article.slug