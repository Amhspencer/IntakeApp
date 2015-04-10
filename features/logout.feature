Feature: Admin and Partner can be able to logout from dashboard.
	
  As an admin or partner
  I can be able to logout from the header menu.

Background:

  Given the following admins exist:
      | email           | name  | password      | phone_number | work_email         |
      | andy@andy.com   | Andy  | andy123       | 5101231234   | andy@workplace.com |

  Given the following admins exist:
      | email           | name  | password      | phone_number | work_email         |
      | bobby@bobby.com | Bobby | bobby123      | 5101233211   | boby@workplace.com |

Scenario: As an admin, i can logout from admin's dashboard.
  When I go to the "/login" page
  And I fill in "session_email" with "andy@andy.com"
  And I fill in "session_password" with "andy123"
  And I click the "Log in" button
  Then I should see "Andy"
  And I should see "Admin"
  When I click the "Log out" link
  Then I should see "Log in"

Scenario: As a partner, i can logout from partner's dashboard.
  When I go to the "/login" page
  And I fill in "session_email" with "bobby@bobby.com"
  And I fill in "session_password" with "bobby123"
  And I click the "Log in" button
  Then I should see "Bobby"
  And I should see "User dashboard"
  When I click the "Log out" link
  Then I should see "Log in"