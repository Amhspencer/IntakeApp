Feature:
  As a partner
  So I can categorize the forms that have been submitted
  I want to sort them by date, site, county, and preferred language.

  Background:
    Given the following partners exist:
        | email           | name  | password      | phone_number | work_email         | active |
        | andy@andy.com   | Andy  | andy123       | 5101231234   | andy@workplace.com | true   |
        | bobby@bobby.com | Bobby | bobby123      | 5101233211   | boby@workplace.com | true   |

    Given the following forms exist:
    | first_name | last_name | medical_facility | preferred_language | service_area  |    date    | processed | user_id |
    | Alan       | Zee       | Zion             | English            | San Mateo     | 4/03/15    | t         | 1       |
    | Steven     | Bing      | Alta Bates       | Tagalog            | San Francisco | 4/02/15    | t         | 1       |

    When I go to the "/login" page
    And I fill in "session_email" with "andy@andy.com"
    And I fill in "session_password" with "andy123"
    And I click the "Log in" button
    Then I should see "Partner"
  
  Scenario: I should be able to sort by the patient's last name
    When I click the "Name" link
    Then I should first see "Bing", then "Zee"
    But I should not see "Zion" before "Alta Bates"

  Scenario: I should be able to sort by date submitted
    When I click the "Date Submitted" link
    Then I should first see "Bing", then "Zee"
    But I should not see "Zion" before "Alta Bates"

  Scenario: I should be able to sort alphabetically by site
    When I click the "Medical Facility" link
    Then I should first see "Alta Bates", then "Zion"
    But I should not see "English" before "Tagalog"

  Scenario: I should be able to sort by county
    When I click the "County" link
    Then I should first see "San Francisco", then "San Mateo"
    But I should not see "Zee" before "Bing"

  Scenario: I should be able to sort by language
    When I click the "Preferred Language" link
    Then I should first see "English", then "Tagalog"
    But I should not see "Bing" before "Zee"