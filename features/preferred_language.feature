Feature: view from in different languages
  As a trusted partner
  So that my client can understand the intake process
  I want to select the client's preferred language.

  Background:
	Given the following partners exist:
    | email           | name  | password      | phone_number | organization | active |
    | cody@cody.com   | Cody  | cody123       | 5103456543   | Kaiser       | true   |
    | daddy@daddy.com | Daddy | daddy123      | 5106554345   | Alta Bates   | true   |


  Scenario: After clicking on create new form, I can see different languages in "Disclaimer"
  When I go to the "/login" page
  And I fill in "session_email" with "cody@cody.com"
  And I fill in "session_password" with "cody123"
  And I click the "Log in" button
  Then I should see "Partner"

  When I click the "New Client Form" link
  Then I would be at "disclaimer" page
  
  When I click the "English" button
  Then I should see "Thank you for connecting with Breast Cancer Emergency Fund!"

  When I click the "Español" button
  Then I should see "Gracias por la conexión con Breast Cancer Energency Fund!"  
