require 'faker'

FactoryGirl.define do
	factory :staff do |f|
		f.email "staff@staff.com"
		f.name "Staff Person"
		f.password "staff123"
		f.phone_number "123456"
	end
end