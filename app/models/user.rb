class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :phone_number, :work_email
end
