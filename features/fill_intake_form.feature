Feature:  Fill out intake form
	
	As a qualified intake partner.
	So that I can process the intake of a client.
	I want to fill out the intake form.

Background:

Given the following partners exist:
| email               | name      | password             |  phone_number | work_email       |
| partner@andy.com    | Woody     | ToyStory             |  5101231234   | Woody@pixar.com  |


Scenario:

	When I fill out the form
	And get an electronic signature
	And press submit
	Then I will see confirmation my form has been submitted
	And BCEF will receive my intake form