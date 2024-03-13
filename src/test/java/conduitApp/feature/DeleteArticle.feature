@AddDeleteArticle

Feature: test for deleting an article

Background: Defined URL
Given url apiURL


# Given path 'users/login'
# And request { "user":{"email": "afaraaz@gmail.com","password": "test123"}}
# # And request { "user":{"email": "kar1@test.com","password": "Karate123"}}
# When method Post
# Then status 200
# * def token_id = response.user.token 


#added line number 9 to 14 in the above path from there we calling it here helpers/CreateToken.feature
# * def tokenResponse =  callonce read('classpath:helpers/CreateToken.feature') {"email": "afaraaz@gmail.com","password": "test123"}
#line 18 to read data from paramters where values id defined in helpers/CreateToken.feature
#showing an credentials are not as per the stds so remving and making it more dynamic by adding creds in config filre

#* def tokenResponse =  callonce read('classpath:helpers/CreateToken.feature')
#uncoment above if you wont want to rum without parametere  and uncoment line no 7 and coment line no 9 

#//added code in line 24 and 25 of karate-configfile to remove below 2 lines 28 & 29 in order to make it comon across
#all the feature files// and "Given header Authorization  = 'Token ' + token"

# * def tokenResponse =  callonce read('classpath:helpers/CreateToken.feature')
# * def token = tokenResponse.authToken

Scenario: Craete and Delete Article 
    # Given header Authorization  = 'Token ' + token
    Given path 'articles'
    And request {"article": {"tagList": ["Tags"], "title": "DunkyRoads","description": "Test","body": " through-script "}}
    When method Post
    Then status 201
    * def  articleId = response.article.slug

    # Given params { limit: 10, offset: 0}
    Given path 'articles'
    When method Get
    Then status 200
    # And match response.articles[0].title == 'DunnyTest to Deletes'

    # //commented above code of line , since newly addED article is not showing there in response .
    # hence we dont know index of data feeded in the array//


    
  # Given header Authorization  = 'Token ' + token
  Given path 'articles',articleId
  When method Delete
  Then status 204

  Given params { limit: 10, offset: 0}
  Given path 'articles'
  When method Get
  Then status 200
  And match response.articles[0].title != 'DunkyRoads'
