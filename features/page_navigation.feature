Feature: page_navigation
  In order to test the various pages
  a user
  wants to successfully land on each page

  Scenario: home_page
    Given I am on the home page
    Then  I should see "Korean art of self-defense"

  Scenario: contact_page
    Given I am on the home page
    When  I follow "Contact Us"
    Then  I should be on the contact page
    And   I should see "Hours"

  Scenario: about_page
    Given I am on the contact page
    When I follow "About Us"
    Then I should be on the about page
    And  I should see "Master Thierry Rene"