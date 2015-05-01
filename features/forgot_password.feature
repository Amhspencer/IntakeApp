Feature: Regenerate forgotten password
  As an user of BCCEF (admin/staff/partner)
  If I forget my current password
  I can request to have the new password sent to my email

  Background:
  Given the following admins exist:
      | email           | name  | password      | phone_number | active |
      | andy@andy.com   | Andy  | andy123       | 5101231234   | true   |
      | bobby@bobby.com | Bobby | bobby123      | 5101233211   | true   |

  Scenario:
    When I go to the "/login" page
    And I fill in "session_email" with "andy@andy.com"
    And I fill in "session_password" with "andy12356"
    And I click the "Log in" button
    Then I should see "Invalid email/password combination"

    When I click the "Forgot Password?" link    
    And I fill in "password_reset_email" with "andy123@andy.com"
    And I click the "Submit" button
    Then I should see "Email address does not exist"

    When I fill in "password_reset_email" with "andy@andy.com"
    And I click the "Submit" button
    Then I should see "You will receive an email with password soon"    
