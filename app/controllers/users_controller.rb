class UsersController < ApplicationController
  # show user's profile based on the ID, if not logged in the redirect to login
   
  def show
    id = params[:id]
    @user = User.find(id)
    if (@user.type == "Admin")
      puts "Admin  AAAAA"
      redirect_to admin_path id
    else if (@user.type == "Staff")
      puts ("Staff SSSSSSS")
      redirect_to staff_path id
    else if (@user.type == "Partner")
      puts "Partner PPPPPP"
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
end
