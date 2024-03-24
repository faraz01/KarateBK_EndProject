

Feature: Tests for a home page

Background: Defined URL
Given url 'https://conduit-api.bondaracademy.com/api/'

@smoke
Scenario: Get all available Tags
    Given path 'tags'
    When method Get
    Then status 200
    And match response.tags contains ['Test','Zoom']
    And match response.tags !contains ['Ahmed','git']

    And match response.tags contains any ['Test','Zoom','Faraaz']
    And match response.tags == "#array"
    # And match each response.tags == "#String"
    #removed above script as of now failing

@smoke2

Scenario: Get 10 articles from homepage

    * def timeValidator = read('classpath:helpers/timeValidator.js')
   
    # Given param limit = 10
    # Given param offset = 0
# Above commented also work
    Given params { limit: 10, offset: 0}
    Given path 'articles'
    When method Get
    Then status 200
    And match response.articles == '#[10]'
    And match response.articlesCount == 21
    And match response =={"articles": "#array" , "articlesCount": 21 }
    And match response.articles[0].createdAt contains '2024'
    And match response.articles[*].favoritesCount contains 0
    And match response..bio contains null
    # And match response.articles[*].author.following == false
    And match each response..following == false
    # To Check below response type is what -fuzzy matching line 40-41
    And match each response..following == '#boolean'
    And match each response.articles[*].favoritesCount == '#number'
    # if samekind of key has the different values i'e {Null or text} in array of response -fuzzy matching l42
    And match each response..bio == '##String' 
    #Above line 43 checks key has an NULL/String Value or it aslo true if bio key is available for any of the array
    #if we remove single-# from ''##String'' above assertion fail , since we have both String and Null value in an array

    # Schema Validation 
    And match each response.articles == 
    """
        {
            "slug": "#string",
            "title": "#string",
            "description": "#string",
            "body": "#string",
            "tagList": "#array",
            "createdAt": "#? timeValidator(_)",
            "updatedAt": "#? timeValidator(_)",
            "favorited": '#boolean',
            "favoritesCount": '#number',
            "author": {
                "username": "#string",
                "bio": ##string,
                "image": "#string",
                "following": '#boolean'
            }
        }

    """


@SchemaValidation

Scenario: Get 10 articles from homepage - Schema Validation

    * def timeValidator = read('classpath:helpers/timeValidator.js')
    Given params { limit: 10, offset: 0}
    Given path 'articles'
    When method Get
    Then status 200
    And match response =={"articles": "#[10]" , "articlesCount": 21 }

    And match each response.articles == 
    """
        {
            "slug": "#string",
            "title": "#string",
            "description": "#string",
            "body": "#string",
            "tagList": "#array",
            "createdAt": "#? timeValidator(_)",
            "updatedAt": "#? timeValidator(_)",
            "favorited": '#boolean',
            "favoritesCount": '#number',
            "author": {
                "username": "#string",
                "bio": ##string,
                "image": "#string",
                "following": '#boolean'
            }
        }

    """
# for timeValidator download code from git karate from Schema validation and paste it under 
#file created under helpers and update the date format as per in response and call that functio
#in feature file

