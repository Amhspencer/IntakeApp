class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.where(email: params[:session][:email].downcase).first
    if @user && @user.authenticate(params[:session][:password]) && @user.active
      log_in @user
      if is_partner_session?
        redirect_to partner_path @user.id
      elsif is_admin_session?
        redirect_to admin_path @user.id
      elsif is_staff_session?
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
