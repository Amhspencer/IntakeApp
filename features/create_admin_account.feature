Feature: Create New Admin Account
	
  As an admin user at BCEF.
  So that more people at BCEF can process intake form.
  I want to create a new admin account.

Background:

	Given the following admins exist:
      | email           | name  | password      | phone_number | work_email         | active |
      | andy@andy.com   | Andy  | andy123       | 5101231234   | andy@workplace.com | true   |
      | bobby@bobby.com | Bobby | bobby123      | 5101233211   | boby@workplace.com | true   |

Scenario: I need to be an admin to create a new admin. As an admin, i can create new admins
  When I go to the "/login" page
  And I fill in "session_email" with "andy@andy.com"
  And I fill in "session_password" with "andy123"
  And I click the "Log in" button
  Then I should see myself as an "Admin"

  When I go to the "/createadmin" page
  And I fill in "admin_name" with "Will Smith"
  And I fill in "admin_email" with "wsmith@yahoo.com"
  And I fill in "admin_password" with "will123"
  And I fill in "admin_phone_number" with "5145341234"
  And I fill in "admin_work_email" with "wsmith@kaiser.com"
  And I click the "Create new admin" button
  Then I should see "Admin created successfully!"