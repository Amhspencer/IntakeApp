class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(email: params[:session][:email].downcase).first
    if user && user.authenticate(params[:session][:password])
      log_in user
      if session[:user_role] == "Partner"
        redirect_to partner_path user.id
      else
        # redirect to admin dashboard, for now just redirect here
        redirect_to user
      end
      
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    #redirect_to root_url
  end
end
