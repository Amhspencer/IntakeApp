class PartnersController < UsersController


  def create
    #authenticate_user
    @partner = Partner.create!(params[:partner])
    if @partner.save
      flash[:success] = "Partner created successfully!"
      redirect_to admin_path(session[:user_id])
    else
      render 'new'
    end
  end
  
  def show
    #authenticate_user
    id = params[:id]
    @partner = Partner.find(id)
    @all_forms = @partner.forms

  end

end
