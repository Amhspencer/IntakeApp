Feature: Visitor - or unloggedin user - cannot be able to browse or execute any functions of the website.
	
  As a visitor or unlogged-in user
  I cannot be able to visit any routes
  And I will always be redirected to Login

Background:

  Given the following admins exist:
      | email           | name  | password      | phone_number | work_email         | admin |
      | andy@andy.com   | Andy  | andy123       | 5101231234   | andy@workplace.com | t     |

  Given the following admins exist:
      | email           | name  | password      | phone_number | work_email         | admin |
      | bobby@bobby.com | Bobby | bobby123      | 5101233211   | boby@workplace.com | f     |

Scenario: As a visitor, when I go to the admins route i will be redirected to Login.
  When I go to the "/login" page
  And I go to the "/admins/1" page
  Then I should see "Log in"

Scenario: As a visitor, when I go to the partners route i will be redirected to Login.
  When I go to the "/login" page
  And I go to the "/partners/1" page
  Then I should see "Log in"

Scenario: As a visitor, when I go to the users route i will be redirected to Login.
  When I go to the "/users" page
  Then I should see "Log in"