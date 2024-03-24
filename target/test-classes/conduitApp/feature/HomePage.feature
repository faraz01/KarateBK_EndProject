

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
    Given path 'articles'
    # Given param limit = 10
    # Given param offset = 0
# Above commented also work
    Given params { limit: 10, offset: 0}
    When method Get
    Then status 200
    And match response.articles == '#[10]'
    And match response.articlesCount == 21
    And match response =={"articles": "#array" , "articlesCount": 21 }
    And match response.articles[0].createdAt contains '2024'
    And match response.articles[*].favoritesCount contains 0