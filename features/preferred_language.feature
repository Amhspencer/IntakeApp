Feature: view from in different languages
  As a trusted partner
  So that my client can understand the intake process
  I want to select the client's preferred language.

  Background:
	Given the following partners exist:
    | email           | name  | password      | phone_number | work_email         | organization | admin |
    | cody@cody.com   | Cody  | cody123       | 5103456543   | andy@workplace.com | Kaiser       | f     |
    | daddy@daddy.com | Daddy | daddy123      | 5106554345   | dady@workplace.com | Alta Bates   | f     |


  Scenario: After clicking on create new form, I can see different languages in "Disclaimer"
  When I go to the "/login" page
  And I fill in "session_email" with "cody@cody.com"
  And I fill in "session_password" with "cody123"
  And I click the "Log in" button
  Then I should see "User dashboard"

  When I click the "New Client Form" button
  Then I would be at "disclaimer" page
  
  When I click the "English" button
  Then I should see "Thank you for connecting with Breast Cancer Emergency Fund!"

  When I click the "Spanish" button
  Then I should see "Esto mantendrá la exención de responsabilidad"  

  When I click the "Cantonese" button
  Then I should see "這將舉辦免責聲明"  

  When I click the "Russian" button
  Then I should see "Это будет держать отказ"  

  When I click the "Vietnamese" button
  Then I should see "Điều này sẽ tổ chức khuyến cáo"  
