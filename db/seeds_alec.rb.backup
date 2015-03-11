# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admins = [{:name => 'Savannah Dunlap', :email => 'savannah@gmail.com', :work_email => 'savannah@bcef.org', :password => 'killCancer', :phone_number => 1235673912}]

partners = [{:name => 'Katie Chen', :email => 'kchen@gmail.com', :work_email => 'katie@mountzion.org', :password => 'katieisgr8', :phone_number => 9871237654, :organization => 'Mount Zion Cancer Center'}]

forms = [{:first_name => 'Samantha', :middle_initial => 'R', :last_name => 'Smith', :date_of_birth => '1980-11-08 02:09:15', :phone_number => 1324657980, :preferred_language => 'English', :cancer_care_provider => 'John O\' Reilly', :service_area => 'San Francisco County', :surgery => false, :chemo => false, :radiation => false, :late_stage => true, :income => 'Unsure', :additional_info => false, :consent => true, :signature => 'Katie Chen', :date => '2015-03-06 04:18:56'}, {:first_name => 'Carina', :middle_initial => 'J', :last_name => 'Fernandez', :date_of_birth => '1985-11-08 02:09:15', :phone_number => '5107806100', :preferred_language => 'Spanish', :cancer_care_provider => 'E. Cho', :service_area => 'Santa Clara County', :surgery => false, :chemo => false, :radiation => true, :late_stage => false, :income => 'Yes', :additional_info => false, :consent => true, :signature => 'Katie Chen', :date => '2015-03-01 08:19:29'}]

admins.each do |admin|
  Admin.create!(admin)
end

partners.each do |partner|
  Partner.create!(partner)
end

forms.each do |form|
  Form.create!(form)
end
