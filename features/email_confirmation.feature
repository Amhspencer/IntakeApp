Feature: When a new form is created, info@bcef.org should receive an email alert
  As a member of BCEF
  So that I am aware of a new form that needs processing
  I want to receive an email alert

  Background:
    Given the following admins exist:
    | email           | name  | password      | phone_number | active |
    | andy@andy.com   | Andy  | andy123       | 5101231234   | true   |
    | bobby@bobby.com | Bobby | bobby123      | 5101233211   | true   |

    
  Scenario: After I complete the form, info@bcef should get an email alert
    When I go to the "/login" page
    And I fill in "session_email" with "andy@andy.com"
    And I fill in "session_password" with "andy123"
    And I click the "Log in" button
    Then I should see myself as an "Admin"

    When I click the "New Client Form" link
    Then I would be at "disclaimer" page
    When I click the "Continue" link
    Then I would be at "Create New Form" page

    And I fill in "form_first_name" with "Will"
    And I fill in "form_middle_initial" with "T"
    And I fill in "form_last_name" with "Smith"
    And I fill in "form_date_of_birth" with "02-05-1985"
    And I fill in "form_phone_number" with "4153245654"
    And I select option "English" from "form_preferred_language"
    And I fill in "form_medical_facility" with "San Mateo"
    And I fill in "form_cancer_care_provider" with "Kaiser"
    And I choose "San Mateo County" from radio option
    And I check the checkbox "form_radiation"
    And I choose "Yes" from radio option
    And I check the checkbox "form_additional_info"
    And I check the checkbox "form_consent"
    And I click the "Submit Intake Form" button
    Then I should see "Diplaying Form ID"
    
    When I click the "Continue" link
    Then I should see "confirmation"
    And I should see "You will recieve an email confirming your form submission and your form will be processed within 24 hours"
  