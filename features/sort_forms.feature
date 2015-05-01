Feature:
  As an admin or staff
  So I can categorize the forms that have been submitted
  I want to sort them by date, site, county, and preferred language.

  Background:
    Given the following forms exist:
    | first_name | last_name | medical_facility | preferred_language | service_area  |    date    | processed |
    | Alan       | Zee       | Zion             | English            | San Mateo     | 4/03/15    | t         |
    | Steven     | Bing      | Alta Bates       | Tagalog            | San Francisco | 4/02/15    | t         |
    | Dave       | Jones     | Kaiser           | Spanish            | Santa Clara   | 3/15/15    | f         |
    | John       | Doe       | Sutter Health    | Cantonese          | San Francisco | 4/10/15    | f         |
    And I am logged in as an admin
    And I should see "Bing"
    And I should see "Processed Forms"
  
  Scenario: I should be able to sort by the patient's last name
    When I click on the id "proc_name"
    Then I should first see "Processed Forms", then "Bing"
    And I should first see "Zee", then "Bing"
    But I should not see "Alta Bates" before "Zion"

  Scenario: I should be able to sort by date submitted
    When I click on the id "proc_date"
    Then I should first see "Processed Forms", then "Bing"
    And I should first see "Zee", then "Bing"
    But I should not see "Alta Bates" before "Zion"

  Scenario: I should be able to sort alphabetically by site
    When I click on the id "proc_facility"
    Then I should first see "Processed Forms", then "Bing"
    And I should first see "Zee", then "Bing"
    But I should not see "Tagalog" before "English"

  Scenario: I should be able to sort by county
    When I click on the id "proc_county"
    And I should first see "Zee", then "Bing"
    And I should first see "San Francisco", then "San Mateo"
    But I should not see "Bing" before "Zee"

  Scenario: I should be able to sort by language
    When I click on the id "proc_language"
    Then I should first see "Processed Forms", then "Bing"
    And I should first see "English", then "Tagalog"
    But I should not see "Bing" before "Zee"    

  Scenario: I should be able to sort unprocessed forms the same way
    When I click on the id "proc_name"
    Then I should first see "Unprocessed Forms", then "Jones"
    And I should first see "Jones", then "Doe"
    And I should not see "Sutter" before "Kaiser"
    When I click on the id "proc_date"
    Then I should first see "Jones", then "Doe"
    But I should not see "Sutter" before "Kaiser"
    When I click on the id "proc_facility"
    Then I should first see "Kaiser", then "Sutter"
    But I should not see "Doe" before "Jones"
    When I click on the id "proc_county"
    Then I should first see "Jones", then "Doe"
    But I should not see "San Francisco" before "Santa Clara"
    When I click on the id "proc_language"
    Then I should first see "Spanish", then "Cantonese"
    But I should not see "Doe" before "Jones"

