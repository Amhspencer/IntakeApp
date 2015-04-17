Feature: Create New Staff Account
  
  As an admin user at BCEF.
  So that more people at BCEF can process intake form.
  I want to create a new staff account.

Background:

  Given the following admins exist:
      | email           | name  | password      | phone_number | work_email         |
      | andy@andy.com   | Andy  | andy123       | 5101231234   | andy@workplace.com |
      | bobby@bobby.com | Bobby | bobby123      | 5101233211   | boby@workplace.com |

  Scenario:
    When I go to the "/login" page
    And I fill in "session_email" with "andy@andy.com"
    And I fill in "session_password" with "andy123"
    And I click the "Log in" button
    Then I should see myself as an "Admin"

    When I click the "Create New Staff Account" button
    And I fill in "staff_name" with "Will Smith"
    And I fill in "staff_email" with "wsmith@yahoo.com"
    And I fill in "staff_password" with "will123"
    And I fill in "staff_phone_number" with "5145341234"
    And I fill in "staff_work_email" with "wsmith@kaiser.com"
    And I click the "Create new staff" button
    Then I should see "Staff created successfully!"