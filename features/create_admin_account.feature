Feature: Create New Admin Account
	
	As an admin user at BCEF.
	So that more people at BCEF can process intake forms.
	I want to create a new admin account.

Background:

	Given that I am logged in as a BCEF admin

Scenario:
	
	When I select see accounts page.
	And choose create new admin account.
	And fill in the required fields
	And click submit
	Then there should be a new admin account
	And I should see it on the accounts page
