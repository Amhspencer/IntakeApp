Given /the following admins exist/ do |admins_table|
  admins_table.hashes.each do |admin|
    Admin.create admin
  end
  #flunk "Unimplemented"
end

Given /the following partners exist/ do |partners_table|
  partners_table.hashes.each do |partner|
    Partner.create partner
  end
  #flunk "Unimplemented"
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

Then /I should see myself as an "(.*)"/ do |role|
	assert page.body =~ /#{role}/
end

Then /I should see "(.*)"/ do |msg|
	assert page.body =~ /#{msg}/
end

Then /I would be at "(.*)" page/ do |pg|
	assert page.body =~ /#{pg}/
end

When /I click the "(.*)" link/ do |lk|
	click_link lk
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