
@articles
Feature: Posting an articles on a site

Background: Defined URL
Given url apiURL
# * def tokenResponse =  callonce read('classpath:helpers/CreateToken.feature')
# * def token = tokenResponse.authToken

# Given path 'users/login'
#below creds not required
#And request { "user":{"email": "afaraaz@gmail.com","password": "test123"}}
#And request { "user":{"email": "kar1@test.com","password": "Karate123"}}
# When method Post
# Then status 200
# * def token = response.user.token 

Scenario: Validate Posting an Scenarios
 
    # Given header Authorization  = 'Token ' + token
    Given path 'articles'
    And request {"article": {"tagList": ["Tags"], "title": "afaraaz0786","description": "Test","body": " through-script "}}
    When method Post
    Then status 201
    And match response.article.title == 'afaraaz0786'
    
@CheckArt
Scenario: Get  articles from homepage
    Given path 'articles'
    # Given params { limit: 10, offset: 0}
    When method Get
    Then status 200
    # And match response.articles == '#[10]'
    And match response.articlesCount == 19
    # And match response.article.title == 'afaraaz03'