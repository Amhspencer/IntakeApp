Feature: Fill in Intake Form as a Partner
	
  As an Partner at BCEF I can fill out intake form.

Background:

	Given the following partners exist:
    | email           | name  | password      | phone_number | work_email         | organization | admin |
    | cody@cody.com   | Cody  | cody123       | 5103456543   | andy@workplace.com | Kaiser       | f     |
    | daddy@daddy.com | Daddy | daddy123      | 5106554345   | dady@workplace.com | Alta Bates   | f     |

Scenario: After I login as a partner, I can create a new Client (Intake) Form
  When I go to the "/login" page
  And I fill in "session_email" with "cody@cody.com"
  And I fill in "session_password" with "cody123"
  And I click the "Log in" button
  Then I should see "Userdash board"

  When I click the "New Client Form" button
  Then I would be at "disclaimer" page
  When I click the "Continue" link
  Then I would be at "BCEF Intake Form" page

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
