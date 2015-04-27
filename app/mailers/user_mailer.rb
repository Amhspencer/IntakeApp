class UserMailer < ActionMailer::Base
  default from: "do-not-reply@bcef.com"

  def password_reset(user)
    @user = user
    @newpass = rand(36**8).to_s(36)
    @user.update_attributes(:password => @newpass)
    mail to: user.email, subject: "Password reset"
  end

  def email_confirmation(user, form)
  	# No idea why i can't pass the direct user (not working), but instead saving it into another object
  	@tuser = user
  	@tform = form
    mail to: "changetoinfo@bceflater.org", subject: "New Intake Form"
  end
end
