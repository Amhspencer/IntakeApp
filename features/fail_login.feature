Feature: notification when login fails
	
  As a user with an account
  When I type in the wrong username or password
  I will see a warning message so that I know my mistake.

Background:

	Given the following admins exist:
      | email           | name  | password      | phone_number | active |
      | andy@andy.com   | Andy  | andy123       | 5101231234   | true   |
      | bobby@bobby.com | Bobby | bobby123      | 5101233211   | true   |

Scenario: I need to be an admin to create a new admin. As an admin, i can create new admins
  When I go to the "/login" page
  And I fill in "session_email" with "andy@andy.com"
  And I fill in "session_password" with "andy12356"
  And I click the "Log in" button
  Then I should see "Invalid email/password combination"
