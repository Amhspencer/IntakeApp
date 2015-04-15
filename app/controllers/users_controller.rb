class UsersController < ApplicationController
  # show user's profile based on the ID, if not logged in the redirect to login
   
  before_filter :authenticate_user

  def show
    id = params[:id]
    @user = User.find(id)
    if (@user.type == "Admin")
      redirect_to admin_path id
    elsif (@user.type == "Staff")
      redirect_to staff_path id
    else (@user.type == "Partner")
      redirect_to partner_path id
    end
  end
  
  # when someone visits /users/ it will automatically redirect to login
  def index
  	redirect_to login_path
  end

  # create new user, either Admin or Partner
  def new
  end

  def create
  end

  def authenticate_user
    if !session[:user_id]
      redirect_to login_path
    else
      if session[:user_role] == :admin  && params[:id].to_i != session[:user_id]
        redirect_to admin_path session[:user_id] and return
      elsif session[:user_role] == :partner && params[:id].to_i != session[:user_id]
        redirect_to partner_path session[:user_id] and return
      elsif session[:user_role] == :staff && params[:id].to_i != session[:user_id]
        redirect_to staff_path session[:user_id] and return
      end
    end
  end

  
end
