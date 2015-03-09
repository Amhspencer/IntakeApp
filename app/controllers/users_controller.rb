class UsersController < ApplicationController
  # show user's profile based on the ID, if not logged in the redirect to login
  def show
  	if session[:user_id] == nil || session[:user_id].blank?
  		redirect_to login_path
  	else
    	@user = User.find(params[:id])
      if @user.organization.nil? || @user.organization.blank?
        @user_role = "Admin"
      else
        @user_role = "Partner"
      end
    end
  end

  # when someone visits /users/ it will automatically redirect to login
  def index
  	redirect_to login_path
  end

  def new
  end
end
