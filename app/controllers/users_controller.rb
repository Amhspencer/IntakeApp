class UsersController < ApplicationController
  # show user's profile based on the ID, if not logged in the redirect to login
  def show
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
