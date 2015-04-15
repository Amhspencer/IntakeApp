class UsersController < ApplicationController
  # show user's profile based on the ID, if not logged in the redirect to login
   
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

  # def authenticate_user
  #   if !session[:user_id]
  #     redirect_to login_path
  #   elsif session[:user_role] == :partner
  #     redirect_to partner_path session[:user_id]
  #   elsif session[:user_role] == :staff
  #     redirect_to staff_path session[:user_id]
  #   end
  # end
  
end
