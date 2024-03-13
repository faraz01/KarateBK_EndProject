
@smoke
Feature: Tests for a home page

Background: Defined URL
Given url 'https://conduit-api.bondaracademy.com/api/'


Scenario: Get all available Tags
    Given path 'tags'
    When method Get
    Then status 200
    And match response.tags contains ['YouTube','Bondar Academy']
    And match response.tags !contains ['Ahmed','Faraaz']
    And match response.tags == "#array"
    # And match each response.tags == "#String"



Scenario: Get 10 articles from homepage
    Given path 'articles'
    # Given param limit = 10
    # Given param offset = 0
# Above commented also work
    Given params { limit: 10, offset: 0}
    When method Get
    Then status 200
    And match response.articles == '#[10]'
    And match response.articlesCount == 10