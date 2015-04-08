Feature: Partner viewing partner's previously submitted forms
  As a partner
  So that I can keep records of my previous client interactions
  I want to view read-only copies of my previously submitted forms.

  Background:
    Given that I am logged in as a partner

  Scenario:
    Then I should see a list of previously submitted forms
    When I select a form
    Then I should see that form
    And I should be able to return to previously submitted forms

