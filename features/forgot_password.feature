Feature: Regenerate forgotten password
  As a user
  So that I can continue working if I forget my password
  I want to create a new password

  Background:
    Given I am on the login page

  Scenario:
    When I enter my email
    And I click "Forgot password?"
    Then I should see a page telling me an email has been sent
    And I cannot login with my old password

