Feature: Keep form viewing clean
  As a user of BCEF
  So that the dash does not get overfilled with forms
  I want to view only 10 forms per page

  Background:
    Given the following forms exist:
    | first_name | last_name | medical_facility | preferred_language | service_area  |    date    | processed |
    | Alan       | Zee       | Zion             | English            | San Mateo     | 4/03/15    | t         |
    | Steven     | Bing      | Alta Bates       | Tagalog            | San Francisco | 4/02/15    | t         |
    | Alan       | Zee       | Zion             | English            | San Mateo     | 4/03/15    | t         |
    | Steven     | Bing      | Alta Bates       | Tagalog            | San Francisco | 4/02/15    | t         |
    | Alan       | Zee       | Zion             | English            | San Mateo     | 4/03/15    | t         |
    | Steven     | Bing      | Alta Bates       | Tagalog            | San Francisco | 4/02/15    | t         |
    | Alan       | Zee       | Zion             | English            | San Mateo     | 4/03/15    | t         |
    | Steven     | Bing      | Alta Bates       | Tagalog            | San Francisco | 4/02/15    | t         |
    | Alan       | Zee       | Zion             | English            | San Mateo     | 4/03/15    | t         |
    | Steven     | Bing      | Alta Bates       | Tagalog            | San Francisco | 4/02/15    | t         |
    | Alan       | Zee       | Zion             | English            | San Mateo     | 4/03/15    | t         |
    | Steven     | Bing      | Alta Bates       | Tagalog            | San Francisco | 4/02/15    | t         |
    | Alan       | Zee       | Zion             | English            | San Mateo     | 4/03/15    | t         |
    | Steven     | Bing      | Alta Bates       | Tagalog            | San Francisco | 4/02/15    | t         |
    | Alan       | Zee       | Zion             | English            | San Mateo     | 4/03/15    | t         |
    | Steven     | Bing      | Alta Bates       | Tagalog            | San Francisco | 4/02/15    | t         |
    | Alan       | Zee       | Zion             | English            | San Mateo     | 4/03/15    | t         |
    | Steven     | Bing      | Alta Bates       | Tagalog            | San Francisco | 4/02/15    | t         |
    | Alan       | Zee       | Zion             | English            | San Mateo     | 4/03/15    | t         |
    | Steven     | Bing      | Alta Bates       | Tagalog            | San Francisco | 4/02/15    | t         |
    | Dave       | Jones     | Kaiser           | Spanish            | Santa Clara   | 3/15/15    | f         |
    | John       | Doe       | Sutter Health    | Cantonese          | San Francisco | 4/10/15    | f         |
    | Dave       | Jones     | Kaiser           | Spanish            | Santa Clara   | 3/15/15    | f         |
    | John       | Doe       | Sutter Health    | Cantonese          | San Francisco | 4/10/15    | f         |
    | Dave       | Jones     | Kaiser           | Spanish            | Santa Clara   | 3/15/15    | f         |
    | John       | Doe       | Sutter Health    | Cantonese          | San Francisco | 4/10/15    | f         |
    | Dave       | Jones     | Kaiser           | Spanish            | Santa Clara   | 3/15/15    | f         |
    | John       | Doe       | Sutter Health    | Cantonese          | San Francisco | 4/10/15    | f         |
    | Dave       | Jones     | Kaiser           | Spanish            | Santa Clara   | 3/15/15    | f         |
    | John       | Doe       | Sutter Health    | Cantonese          | San Francisco | 4/10/15    | f         |
    | Dave       | Jones     | Kaiser           | Spanish            | Santa Clara   | 3/15/15    | f         |
    | John       | Doe       | Sutter Health    | Cantonese          | San Francisco | 4/10/15    | f         |
    | Dave       | Jones     | Kaiser           | Spanish            | Santa Clara   | 3/15/15    | f         |
    | John       | Doe       | Sutter Health    | Cantonese          | San Francisco | 4/10/15    | f         |
    | Dave       | Jones     | Kaiser           | Spanish            | Santa Clara   | 3/15/15    | f         |
    | John       | Doe       | Sutter Health    | Cantonese          | San Francisco | 4/10/15    | f         |
    | Dave       | Jones     | Kaiser           | Spanish            | Santa Clara   | 3/15/15    | f         |
    | John       | Doe       | Sutter Health    | Cantonese          | San Francisco | 4/10/15    | f         |
    | Dave       | Jones     | Kaiser           | Spanish            | Santa Clara   | 3/15/15    | f         |
    | John       | Doe       | Sutter Health    | Cantonese          | San Francisco | 4/10/15    | f         |
    | John       | Doe       | Sutter Health    | Cantonese          | San Francisco | 4/10/15    | f         |
    
	And I am logged in as an admin

  Scenario: I will only see 10 unprocessed forms and 10 processed forms
  	When I click on the id "proc_name"
  	Then I should see the text "Showing 1 to 10 of 20 entries"
  	And I should see the text "Showing 1 to 10 of 21 entries"
  	When I click the next button for "unprocessed"
  	Then I should see the text "Showing 11 to 20 of 21 entries"
  	When I click the next button for "processed"
  	Then I should see the text "Showing 11 to 20 of 20 entries"