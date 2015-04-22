Feature:
  As a user
  So that I know when forms have been seen by BCEF staff
  I want to see the date that a form has been processed.

  Background:
    Given I am logged in as an admin
# This form needs an attribute to attach it to a partner who submitted it
    And the following forms exist:
    | first_name | last_name | medical_facility | preferred_language | processed |
    | John       |  Doe      | Kaiser           | English            | f         |
    And I should see this form's processing date as blank

  Scenario: I should be able to see the current date when I process it
    When I process the form
    Then I should see today's date in the processing date field

  Scenario: Partners should also see the processing date
    When I process the form
    And I click the "Log Out" button
    And I log in as a partner
    Then I should see today's date in the processing date field

