Feature: Create New Partner Account
	
	As an admin user at BCEF.
	So that I can grow the base of qualified intake partners. 
	I want to create a new partner account.

Background:

	Given that I am logged in as a BCEF admin

Scenario:
	
	When I know who my partners are
	And I want them to be able to fill out the intake form
	Then I should 	be able to allow those partner and only those partners restricted access to the form
	When I am done with the list of partners and hit save
	I should be able to view and edit my list of partners
	And those partners and only those partners should be able to fill out the intake form