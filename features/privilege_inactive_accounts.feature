Feature: Inactive accounts cannot be able to login.
	
  As an inactive member
  I cannot be able to login

Background:

  Given the following admins exist:
      | email           | name  | password      | phone_number | work_email         | active |
      | andy@andy.com   | Andy  | andy123       | 5101231234   | andy@workplace.com | false  |
      | baby@baby.com   | Baby  | baby123       | 5101212345   | baby@workplace.com | true   |

Scenario: As an inactive user, i cannot be able to login.
  When I go to the "/login" page
  And I fill in "session_email" with "andy@andy.com"
  And I fill in "session_password" with "andy123"
  And I click the "Log in" button
  Then I should see "Invalid email/password combination"