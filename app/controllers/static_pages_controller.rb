class StaticPagesController < ApplicationController
  def disclaimer
  	authenticate_user
  end

  def confirmation
  	authenticate_user
  end

  #def partnerdashboard
  # 	authenticate_user
  #end

  def notadmin
  end

# call this method first to make sure only admin can perform the action
  def authenticate_user
    if !session[:user_id]
      redirect_to login_path
    end
  end  
end
