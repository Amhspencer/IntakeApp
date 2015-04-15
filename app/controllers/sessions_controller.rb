class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.where(email: params[:session][:email].downcase).first
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      if session[:user_role] == :partner
        redirect_to partner_path @user.id
      elsif session[:user_role] == :admin
        redirect_to admin_path @user.id
      elsif session[:user_role] == :staff
        redirect_to staff_path @user.id
      end
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
