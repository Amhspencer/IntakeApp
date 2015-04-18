class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :phone_number, :work_email, :active
  has_many :forms

  validates :name, presence: true, length: { maximum: 50 }    # validate the name field
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 },
  format: { with: VALID_EMAIL_REGEX }, uniqueness: true       # validate the email field
  has_secure_password                                         # secured password
#validates :password, length: { minimum: 6 }                 # validate password

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end 

  # Send reset email
  def send_password_reset_email
        UserMailer.password_reset(self).deliver
  end

  def deactivate
    self.active = false
    self.save!
  end

  def reactivate
    self.active = true
    self.save!
  end
end
