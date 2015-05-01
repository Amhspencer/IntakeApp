Feature: Inactive accounts cannot be able to login.
	
  As an inactive member
  I cannot be able to login

Background:

  Given the following admins exist:
      | email           | name  | password      | phone_number | active |
      | andy@andy.com   | Andy  | andy123       | 5101231234   | false  |
      | baby@baby.com   | Baby  | baby123       | 5101212345   | true   |

Scenario: As an inactive user, i cannot be able to login.
  When I go to the "/login" page
  And I fill in "session_email" with "andy@andy.com"
  And I fill in "session_password" with "andy123"
  And I click the "Log in" button
  Then I should see "Invalid email/password combination"