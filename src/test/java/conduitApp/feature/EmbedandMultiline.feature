

Feature: SignUp API- creating users for site

Background: Preconditions
    * def dataGenerator = Java.type('helpers.DataGenerator')
    Given url apiURL



@SignUpAPI
Scenario: Sign Up new user
    # Given def userData = {"email":"Testuser786@test.com","username":"Testuser786"}

        # Comented above line since no need of it -since we added line 30-32
# Calling methid from helpers/DataGenerator'

        * def randomEmail = dataGenerator.getRandomEmail()
        * def randomUsername = dataGenerator.getRandomUsername()

    Given path 'users'
    #line 16 and 18 both send an request to the server way sending request is different 
    
    # And request {"user":{"email":#('Test'+userData.email),"password":"test1234","username":#('User'+userData.username)}}
    
    And request
    """
{
    "user": {
        "email": #(randomEmail),
        "password": "test123",
        "username": #(randomUsername)
    }
}

    """
    
    When method Post
    Then status 201
    And match response ==

    """
        {
            "user": {
                "id": #number,
                "email": #(randomEmail),
                "username": #(randomUsername),
                "bio": null,
                "image": "https://api.realworld.io/images/smiley-cyrus.jpeg",
                "token": "#string"
            }
        }





    """




    # And match response.user.username == #('User'+userData.username)
    
    # Given path 'articles'
    # And request {"article": {"tagList": ["Tags", "wipro", "wilearn"], "title": "Udemy_Wilearn","description": "Test","body": " through-script-karate"}}
    # When method Post
    # Then status 201
    # * def  articleId = response.article.slug