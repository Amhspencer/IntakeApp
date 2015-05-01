Feature: Visitor - or unloggedin user - cannot be able to browse or execute any functions of the website.
	
  As a visitor or unlogged-in user
  I cannot be able to visit any routes
  And I will always be redirected to Login

Background:

  Given the following admins exist:
      | email           | name  | password      | phone_number | active |
      | andy@andy.com   | Andy  | andy123       | 5101231234   | true   |

  Given the following partners exist:
      | email           | name  | password      | phone_number | active |
      | bobby@bobby.com | Bobby | bobby123      | 5101233211   | true   |

  Given the following partners exist:
      | email           | name  | password      | phone_number | active |
      | candy@candy.com | Candy | candy123      | 5101233123   | true   |

Scenario: As a visitor, when I go to the admins route i will be redirected to Login.
  When I go to the "/login" page
  And I go to the "/admins/1" page
  Then I should see "Log in"

Scenario: As a visitor, when I go to the partners route i will be redirected to Login.
  When I go to the "/login" page
  And I go to the "/partners/1" page
  Then I should see "Log in"

Scenario: As a visitor, when I go to the staffs route i will be redirected to Login.
  When I go to the "/login" page
  And I go to the "/staff/1" page
  Then I should see "Log in"

Scenario: As a visitor, when I go to the users route i will be redirected to Login.
  When I go to the "/users" page
  Then I should see "Log in"

Scenario: As a visitor, when I go to the disclaimer route i will be redirected to Login.
  When I go to the "/static_pages/disclaimer" page
  Then I should see "Log in"

Scenario: As a visitor, when I go to the user's routes i will be redirected to Login.
  When I go to the "/users/" page
  Then I should see "Log in"