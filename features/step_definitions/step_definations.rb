Given /the following admins exist/ do |admins_table|
  admins_table.hashes.each do |admin|
    Admin.create admin
  end
end

Given /I am logged in as an admin/ do
  Admin.create!(:email => "andy@andy.com", :name => "Andy", :password => "andy123", :active => true)
  visit("/login")
  fill_in "session_email", :with => "andy@andy.com"
  fill_in "session_password", :with =>"andy123"
  click_button "Log in"
  assert page.body =~ /Admin Dashboard/
end

Given /the following partners exist/ do |partners_table|
  partners_table.hashes.each do |partner|
    Partner.create partner
  end
end

Given /the following staffs exist/ do |staffs_table|
  staffs_table.hashes.each do |staff|
    Staff.create staff
  end
end

Given /the following forms exist/ do |forms_table|
  forms_table.hashes.each do |form|
    Form.create! form
  end
end

Given /the following forms with today date exist/ do |forms_table2|
  forms_table2.hashes.each do |form22|
    date = eval(form22["date"])
    Form.create! form22
  end
end

When /I go to the "(.*)" page/ do |link|
	visit(link)
end

And /I fill in "(.*)" with "(.*)"/ do |field, element|
	fill_in field, :with => element
end

And /I click the "(.*)" button/ do |butn|
	click_button butn
end

And /I click "(.*)" of the "(.*)" buttons/ do |where, butn1|
  click_button butn1[where.to_i]
end

Then /I should see myself as an "(.*)"/ do |role|
	#assert page.body =~ /#{role}/
	page.should have_content role
end

Then /I should see "(.*)"/ do |msg|
	assert page.body =~ /#{msg}/
end

Then /I should not see "(.*)" anywhere/ do |msg|
  assert !(page.body =~ /#{msg}/)
end

Then /I should first see "(.*)", then "(.*)"/ do |a, b|
  one = page.body.index(a)
  two = page.body.index(b)
  assert((one and two and one < two), "Incorrect order")
end

Then /I should not see "(.*)" before "(.*)"/ do |a, b|
  one = page.body.index(a)
  two = page.body.index(b)
  assert((one and two and one > two), "Incorrect order")
end

Then /I would be at "(.*)" page/ do |pg|
	assert page.body =~ /#{pg}/
end

When /I click the "(.*)" link/ do |lk|
	click_link lk
end

When /I click the button "(.*)" with id "(.*)"/ do |butn3,lk2|
  click_button lk2
end

When /I click the link "(.*)" called "(.*)"/ do |id, txt|
  within("##{id}") do
    click_link txt
  end
end

And /I select option "(.*)" from "(.*)"/ do |option, form_id|
	select option, :from => form_id
end

And /I choose "(.*)" from radio option/ do |choice|
	choose choice
end

And /I check the checkbox "(.*)"/ do |checkbox|
	check checkbox
end

And /there will be "(.*)" forms in "(.*)" table/ do |num1, form1|
  temp1 = 'table#' + form1 + ' tbody tr'
  #rows_in_table = page.all(temp1).size - 1    : this test is for table without head
  rows_in_table = page.all(temp1).size
  assert(num1.to_i == rows_in_table, rows_in_table.to_s + " does not equal " + num1.to_s)
end

And /there will be "(.*)" users in "(.*)" table/ do |num2, form2|
  temp2 = 'table#' + form2 + ' tbody tr'
  #rows_in_table2 = page.all(temp2).size - 1  : this test is for table without head
  rows_in_table2 = page.all(temp2).size
  assert(num2.to_i == rows_in_table2, rows_in_table2.to_s + " does not equal " + num2.to_s)
end

And /there will be "(.*)" in column "(.*)"/ do |name3, column3|
  within "#"+column3 do
      page.should have_content name3
  end
end

And /there will be today date in column "(.*)"/ do |column4|
  within "#"+column4 do
      page.should have_content Time.now.strftime("%m/%d/%y")
  end
end