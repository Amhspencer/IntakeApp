class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.where(email: params[:password_reset][:email].downcase).first
    if @user
      @user.send_password_reset_email
      flash[:info] = "You will receive an email with password soon"

      redirect_to root_url
    else
      flash.now[:danger] = "Email address does not exist"
      render 'new'
    end
  end

  def edit
  end
end
