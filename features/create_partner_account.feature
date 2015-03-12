Feature: Create New Partner Account
	
  As an admin user at BCEF.
  So that I can grow the base of qualified intake partners. 
  I want to create a new partner account.

Background:

	#Given that I am logged in as a BCEF admin
	Given the following admins exist:
      | email           | name  | password      | phone_number | work_email         |
      | andy@andy.com   | Andy  | andy123       | 5101231234   | andy@workplace.com |
      | bobby@bobby.com | Bobby | bobby123      | 5101233211   | boby@workplace.com |

Scenario: I need to be an admin to create new partner
	When I go to the "/login" page
  And I fill in "session_email" with "andy@andy.com"
  And I fill in "session_password" with "andy123"
  And I click the "Log in" button
  Then I should see myself as an "Admin"

Scenario: As an admin, i can create new partners
  When I go to the "/createpartner" page
  And I fill in "partner_name" with "Will Smith"
  And I fill in "partner_email" with "wsmith@yahoo.com"
  And I fill in "partner_password" with "will123"
  And I fill in "partner_organization" with "Kaiser"
  And I fill in "partner_phone_number" with "5145341234"
  And I fill in "partner_work_email" with "wsmith@kaiser.com"
  And I click the "Create new partner" button
  Then I should see "Partner created successfully!"


	#When I know who my partners are
	#And I want them to be able to fill out the intake form
	#Then I should 	be able to allow those partner and only those partners restricted access to the form
	#When I am done with the list of partners and hit save
	#I should be able to view and edit my list of partners
	#And those partners and only those partners should be able to fill out the intake form

