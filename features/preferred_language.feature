Feature:
  As a trusted partner
  So that my client can understand the intake process
  I want to select the client's preferred language.

  Background:
    Given I am logged in as a partner

  Scenario: When I select "Spanish," I should see a form with Spanish text
    When I create a new form
    And I select "Spanish" from "Preferred Language"
    Then I should see the form in Spanish.

