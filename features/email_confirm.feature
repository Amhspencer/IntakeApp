Feature: When a new form is created, info@bcef.org should receive an email alert
  As a member of BCEF
  So that I am aware of a new form that needs processing
  I want to receive an email alert

  Background:
    Given I am logged in as a partner
    
  Scenario: After I complete the form, info@bcef should get an email alert
    When I fill out a form
    And I press "Submit"
    And I click the "Continue" link
    Then info@bcef.org should receive an email

