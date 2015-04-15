class PartnersController < UsersController

 # def new
 #    authenticate_user
 #    #@partner = Partner.new
 #  end

  def create
    authenticate_user
    @partner = Partner.create!(params[:partner])
    if @partner.save
      flash[:success] = "Partner created successfully!"
      redirect_to admin_path(session[:user_id])
    else
      render 'new'
    end
  end
  
  def show
    authenticate_user
  end

# call this method first to make sure only admin can perform the action
  # def authenticate_user
  #   if !session[:user_id]
  #     redirect_to login_path
  #   end
  # end  
end
