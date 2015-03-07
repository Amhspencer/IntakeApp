class User < ActiveRecord::Base
  attr_accessible :email, :name
  
  validates :name,  presence: true, length: { maximum: 50 }  # validate the name field
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 }, 
  			format: { with: VALID_EMAIL_REGEX }, uniqueness: true # validate the email field

end
