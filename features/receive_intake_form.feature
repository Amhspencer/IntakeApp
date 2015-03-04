Feature: Receive intake form
	
	
	As an admin user at BCEF.
	So that I can process intake forms and start the application process.
	I want to view a recently submitted form.

Background:

	Given that I am logged in as a BCEF admin
	And there is a recently submitted form

Scenario:

	When I select a recently submitted form
	Then I should see the form
	When I am finished I mark the form as processed
	And the form’s status is now processed
