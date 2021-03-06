Feature: Admin can reactivate account
	
  As an admin user at BCEF.
  So that I can adapt as staff and partners change.
  I can reactivate accounts so they can be used again.

Background:

	#Given that I am logged in as a BCEF admin
	Given the following admins exist:
      | email           | name  | password      | phone_number | active |
      | andy@andy.com   | Andy  | andy123       | 5101231234   | true   |
      | bobby@bobby.com | Bobby | bobby123      | 5101233211   | false  |

Scenario: I need to be an admin to deactivate account
	When I go to the "/login" page
  And I fill in "session_email" with "andy@andy.com"
  And I fill in "session_password" with "andy123"
  And I click the "Log in" button
  Then I should see myself as an "Admin"

  When I click the "View All Users" link
  Then there will be "1" users in "active_users" table
  And there will be "1" users in "inactive_users" table

  When I click the button "Reactivated?" with id "2"
  Then there will be "2" users in "active_users" table  
  And there will be "0" users in "inactive_users" table
