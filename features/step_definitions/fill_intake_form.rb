Given /the following partners exist/ do |table|
  admins_table.hashes.each do |partner|
    Partner.create! partner
  end
  #flunk "Unimplemented"
end

When /I fill out the form/ do
  fill_in form_first_name, :with => Woody
  fill_in form_middle_initial, :with => Woody
end



And get an electronic signature
And press submit
Then I will see confirmation my form has been submitted
And BCEF will receive my intake form