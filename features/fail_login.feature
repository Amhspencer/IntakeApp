Feature: notification when login fails
	
  When I type in the wrong username or password I will see a warning message.

Background:

	Given the following admins exist:
      | email           | name  | password      | phone_number | work_email         | admin |
      | andy@andy.com   | Andy  | andy123       | 5101231234   | andy@workplace.com | t     |
      | bobby@bobby.com | Bobby | bobby123      | 5101233211   | boby@workplace.com | t     |

Scenario: I need to be an admin to create a new admin. As an admin, i can create new admins
  When I go to the "/login" page
  And I fill in "session_email" with "andy@andy.com"
  And I fill in "session_password" with "andy12356"
  And I click the "Log in" button
  Then I should see "Invalid email/password combination"
