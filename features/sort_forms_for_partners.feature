Feature:
  As a partner
  So I can categorize the forms that have been submitted
  I want to sort them by date, site, county, and preferred language.

  Background:
    Given the following partners exist:
        | email           | name  | password      | phone_number | active |
        | andy@andy.com   | Andy  | andy123       | 5101231234   | true   |
        | bobby@bobby.com | Bobby | bobby123      | 5101233211   | true   |

    Given the following forms exist:
    | first_name | last_name | medical_facility | preferred_language | service_area  |    date    | processed | user_id |
    | Alan       | Zee       | Zion             | English            | San Mateo     | 4/03/15    | t         | 1       | 
    | Steven     | Bing      | Alta Bates       | Tagalog            | San Francisco | 4/02/15    | t         | 1       |
    | Dave       | Jones     | Kaiser           | Spanish            | Santa Clara   | 3/15/15    | f         | 1       |
    | John       | Doe       | Sutter Health    | Cantonese          | San Francisco | 4/10/15    | f         | 1       |

    When I go to the "/login" page
    And I fill in "session_email" with "andy@andy.com"
    And I fill in "session_password" with "andy123"
    And I click the "Log in" button
    Then I should see "Partner"
  
  Scenario: I should be able to sort by the patient's last name
    When I click the link "proc_name" called "Name"
    Then I should first see "Processed Forms", then "Bing"
    And I should first see "Bing", then "Zee"
    But I should not see "Zion" before "Alta Bates"

  Scenario: I should be able to sort by date submitted
    When I click the link "proc_date" called "Date Submitted"
    Then I should first see "Processed Forms", then "Bing"
    And I should first see "Bing", then "Zee"
    But I should not see "Zion" before "Alta Bates"

  Scenario: I should be able to sort alphabetically by site
    When I click the link "proc_facility" called "Medical Facility"
    Then I should first see "Processed Forms", then "Bing"
    And I should first see "Alta Bates", then "Zion"
    But I should not see "English" before "Tagalog"

  Scenario: I should be able to sort by county
    When I click the link "proc_county" called "County"
    Then I should first see "Processed Forms", then "Bing"
    And I should first see "San Francisco", then "San Mateo"
    But I should not see "Zee" before "Bing"

  Scenario: I should be able to sort by language
    When I click the link "proc_language" called "Preferred Language"
    Then I should first see "Processed Forms", then "Bing"
    And I should first see "English", then "Tagalog"
    But I should not see "Bing" before "Zee"

  Scenario: I should be able to sort unprocessed forms the same way
    When I click the link "unproc_name" called "Name"
    Then I should first see "Unprocessed Forms", then "Jones"
    And I should first see "Doe", then "Jones"
    But I should not see "Kaiser" before "Sutter"
    When I click the link "unproc_date" called "Date Submitted"
    Then I should first see "Jones", then "Doe"
    But I should not see "Sutter" before "Kaiser"
    When I click the link "unproc_facility" called "Medical Facility"
    Then I should first see "Kaiser", then "Sutter"
    But I should not see "Doe" before "Jones"
    When I click the link "unproc_county" called "County"
    Then I should first see "Doe", then "Jones"
    But I should not see "Santa Clara" before "San Francisco"
    When I click the link "unproc_language" called "Preferred Language"
    Then I should first see "Cantonese", then "Spanish"
    But I should not see "Jones" before "Doe"

