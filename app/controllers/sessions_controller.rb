class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.where(email: params[:session][:email].downcase).first
    if @user && @user.authenticate(params[:session][:password]) && @user.active
      log_in @user
      redirect_to_user(@user.id)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end


  def destroy
    log_out
    redirect_to login_path
  end
end
