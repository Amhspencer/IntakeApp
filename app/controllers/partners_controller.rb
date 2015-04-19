class PartnersController < UsersController

  def create
    #authenticate_user
    @partner = Partner.create!(params[:partner])
    @partner.reactivate
    if @partner.save
      flash[:success] = "Partner created successfully!"
      redirect_to admin_path(session[:user_id])
    else
      render 'new'
    end
  end
  
  def show
    form_sorting_for_show()
    @user = Partner.find(params[:id])
    @unprocessedForms = @unprocessedForms.select{ |f| f.user_id == @user.id}
    @processedForms = @processedForms.select{ |f| f.user_id == @user.id}
    @stat = get_statistics()
  end

end
