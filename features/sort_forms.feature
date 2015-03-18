Feature:
  As an admin
  So I can categorize the forms that have been submitted
  I want to sort them by date, site, county, and preferred language.

  Background:
    Given I am logged in as an admin
    And the following forms exist:
# FORM | TABLE | DATA | TO | SORT |
    And I am on the admin dashboard
  
  Scenario: I should be able to sort by date submitted
    When I follow "date"
    Then I should see "Form1" before "Form2"
    But I should not see "Form4" before "Form3"

  Scenario: I should be able to sort alphabetically by site
    When I follow "site"
    Then I should see "Form2" before "Form3"
    But I should not see "Form1" before "Form4"

  Scenario: I should be able to sort by county
    When I follow "county"
    Then I should see "Form1" before "Form3"
    But I should not see "Form2" before "Form4"

  Scenario: I should be able to sort by language
    When I follow "preferred language"
    Then I should see "Form2" before "Form1"
    But I should not see "Form3" before "Form4"

