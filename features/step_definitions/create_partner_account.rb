Given /the following admins exist/ do |admins_table|
  admins_table.hashes.each do |admin|
    Admin.create admin
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