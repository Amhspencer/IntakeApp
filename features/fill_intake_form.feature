Feature:  Fill out intake form
	
	As a qualified intake partner.
	So that I can process the intake of a client.
	I want to fill out the intake form.

Background:

	Given that I am logged in as a partner

Scenario:

	When I fill out the form
	And get an electronic signature
	And press submit
	Then I will see confirmation my form has been submitted
	And BCEF will receive my intake form