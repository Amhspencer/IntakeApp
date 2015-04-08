Feature: Staff-level user
  As an admin
  So that I can have more privileged users than partners
  I want to create a new staff account.

  Background:
    Given that I am logged in as an admin

  Scenario:
    When I choose to create a new staff account
    And I fill in the required fields
    And click submit
    Then I should see the new account on the accounts page

