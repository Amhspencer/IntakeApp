Feature:
  As a user
  So that I know when forms have been seen by BCEF staff
  I want to see the date that a form has been processed.

  Background:
  Given the following admins exist:
      | email           | name  | password      | phone_number | work_email         | active |
      | andy@andy.com   | Andy  | andy123       | 5101231234   | andy@workplace.com | true   |

  Given the following partners exist:
      | email           | name  | password      | phone_number | work_email         | active |
      | bobby@bobby.com | Bobby | bobby123      | 5101233211   | boby@workplace.com | true   |

    Given the following forms with today date exist:
      | first_name | middle_initial | last_name | date_of_birth | phone_number | preferred_language | cancer_care_provider | service_area | surgery | chemo | radiation | late_stage | income | additional_info | consent | signature | date                          | medical_facility | processed | user_id |
      | Will       | T              | Smith     | 04-02-1985    | 5104567654   | English            | San Mateo Area       | San Mateo    | t       | t     | t         | f          | no     | t               | t       | WM        | Time.now.strftime("%Y-%m-%d") | San Mateo        | false     | 2       |
      | Hector     | A              | Gonzalez  | 01-05-1980    | 4805323456   | Spanish            | San Francisco Area   | San Francisco| f       | t     | f         | f          | no     | t               | t       | HG        | Time.now.strftime("%Y-%m-%d") | San Francisco    | false     | 2       |

  Scenario: As an admin, i will see "processed date" and "processed by" after processing a form. Also, As a partner, i will see "processed date" and "processed by" after processing a form
    When I go to the "/login" page
    And I fill in "session_email" with "andy@andy.com"
    And I fill in "session_password" with "andy123"
    And I click the "Log in" button
    Then I should see myself as an "Admin"
    And I should see "Smith"
    And I should see "Gonzalez"
    And there will be "2" forms in "unprocessed_forms" table

    When I click the "Smith, W" link
    And I click the "Mark as Processed" button
    And there will be "1" forms in "processed_forms" table
    And there will be "1" forms in "unprocessed_forms" table
    And there will be "Andy" in column "processed_by"
    And there will be today date in column "processed_date"

    When I click the "Log out" link
    And I go to the "/login" page
    And I fill in "session_email" with "bobby@bobby.com"
    And I fill in "session_password" with "bobby123"
    And I click the "Log in" button
    
    Then I should see myself as an "Partner"
    And I should see "Smith"
    And I should see "Gonzalez"
    And there will be "1" forms in "processed_forms" table
    And there will be "1" forms in "unprocessed_forms" table
    And there will be "Andy" in column "processed_by"
    And there will be today date in column "processed_date"