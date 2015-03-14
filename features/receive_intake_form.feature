Feature: Receive intake form
	
	As an admin at BCEF, I can view my recently submmited form in dashboard.

Background:

	Given the following admins exist:
      | email           | name  | password      | phone_number | work_email         |
      | andy@andy.com   | Andy  | andy123       | 5101231234   | andy@workplace.com |
      | bobby@bobby.com | Bobby | bobby123      | 5101233211   | boby@workplace.com |

    Given the following forms exist:
| first_name | middle_initial | last_name | date_of_birth | phone_number | preferred_language | cancer_care_provider | service_area | surgery | chemo | radiation | late_stage | income | additional_info | consent | signature | date       | medical_facility | processed |
| Will       | Smith          | T         | 04-02-1985    | 5104567654   | English            | San Mateo Area       | San Mateo    | t       | t     | t         | f          | no     | t               | t       | WM        | 02-05-2015 | San Mateo        | false     |
| Hector     | Gonzale        | T         | 01-05-1980    | 4805323456   | Spanish            | San Francisco Area   | San Francisco| f       | t     | f         | f          | no     | t               | t       | HG        | 02-05-2015 | San Francisco    | false     |

Scenario: After I login as an admin, I will see 2 unprocess forms
  When I go to the "/login" page
  And I fill in "session_email" with "andy@andy.com"
  And I fill in "session_password" with "andy123"
  And I click the "Log in" button
  Then I should see myself as an "Admin"
  And I should see "Form 1"
  And I should see "Form 2"
  And there will be "2" forms in "unprocessed_forms" table
  
Scenario: After I login as an admin, and I process 1 form, there will be 1 processed form and 1 unprocessed form
  When I go to the "/login" page
  And I fill in "session_email" with "andy@andy.com"
  And I fill in "session_password" with "andy123"
  And I click the "Log in" button
  Then I should see myself as an "Admin"
  And I should see "Form 1"
  And I should see "Form 2"
  And there will be "2" forms in "unprocessed_forms" table

  When I click the "Form 1" link
  And I click the "Mark as Processed" button
  And there will be "1" forms in "processed_forms" table
  And there will be "1" forms in "unprocessed_forms" table

Scenario: After I login as an admin, and I process 2 forms out of 2, there will be 2 processed forms and no unprocessed form
  When I go to the "/login" page
  And I fill in "session_email" with "andy@andy.com"
  And I fill in "session_password" with "andy123"
  And I click the "Log in" button
  Then I should see myself as an "Admin"
  And I should see "Form 1"
  And I should see "Form 2"
  And there will be "2" forms in "unprocessed_forms" table
  
  When I click the "Form 1" link
  And I click the "Mark as Processed" button
  And I click the "Form 2" link
  And I click the "Mark as Processed" button
  And there will be "2" forms in "processed_forms" table
  And there will be "0" forms in "unprocessed_forms" table

