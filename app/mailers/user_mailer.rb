class UserMailer < ActionMailer::Base
  default from: "do-not-reply@bcef.com"

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
    print user.email
  end

end
