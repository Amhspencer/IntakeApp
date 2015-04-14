class UserMailer < ActionMailer::Base
  default from: "do-not-reply@bcef.com"

  def password_reset(user)
    @user = user
    @newpass = rand(36**8).to_s(36)
    @user.update_attributes(:password => @newpass)
    mail to: user.email, subject: "Password reset"
  end

end
