

Feature: Tests for a home page

Background: Defined URL
Given url apiURL


Scenario: Get all available Tags
    Given path 'tags'
    When method Get
    Then status 200
    And match response.tags contains ['enim','exercitationem']
    And match response.tags !contains 'Ahmed'
    And match response.tags == "#array"
    # And match each response.tags == "String"



Scenario: Get 10 articles from homepage -production
    Given path 'articles'
    # Given param limit = 10
    # Given param offset = 0
# Above commented also work
    Given params { limit: 10, offset: 0}
    When method Get
    Then status 200
    And match response.articles == '#[10]'
    And match response.articlesCount == 251