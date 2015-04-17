Feature: Staff have every function that admins does, except creating new admin.
	
  As a staff
  I can only view my staff's dashboard
  And I cannot view other partner's dashboards.
  And I cannot create new admin, staff or partner account.

Background:

  Given the following admins exist:
      | email           | name  | password      | phone_number | work_email         |
      | andy@andy.com   | Andy  | andy123       | 5101231234   | andy@workplace.com |

  Given the following partners exist:
      | email           | name  | password      | phone_number | work_email         |
      | bobby@bobby.com | Bobby | bobby123      | 5101233211   | boby@workplace.com |

  Given the following staffs exist:
      | email           | name  | password      | phone_number | work_email         |
      | candy@candy.com | Candy | candy123      | 5101231234   | cand@workplace.com |

Scenario: As a staff, i can view my dashboard.
  When I go to the "/login" page
  And I fill in "session_email" with "candy@candy.com"
  And I fill in "session_password" with "candy123"
  And I click the "Log in" button
  Then I should see "Candy"
  And I should see "Staff"

Scenario: As an staff, i cannot view other partners' dashboards.
  When I go to the "/login" page
  And I fill in "session_email" with "candy@candy.com"
  And I fill in "session_password" with "candy123"
  And I click the "Log in" button
  And I go to the "/partners/2" page
  Then I should see "Candy"
  And I should see "Staff"

Scenario: As an staff, i cannot create any type of accounts.
  When I go to the "/login" page
  And I fill in "session_email" with "candy@candy.com"
  And I fill in "session_password" with "candy123"
  And I click the "Log in" button
  Then I should not see "Create new Partner" anywhere
  And I should not see "Create new Staff" anywhere
  And I should not see "Create new Admin" anywhere
