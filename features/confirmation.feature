Feature: Confirmation page after form creation should actually confirm creation
  As a client or user filling out a form
  So that I know my form has been created successfully
  I want the confirmation page to mean the creation is successful.

  Background:
    Given I am logged in as an admin
    
  Scenario: When a form is successfully created, the confirmation should appear
    When I fill out a form
    And I press "Submit"
    Then I should see "Confirmation"
    And the form should exist

  Scenario: When a form is not successfully created, I should see an error page
    When I fill out a form
    But something goes wrong
    And I press "Submit"
    Then I should see "Error"
    And the form should not exist

