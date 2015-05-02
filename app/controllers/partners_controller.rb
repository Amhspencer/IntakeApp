class PartnersController < UsersController

  # @user, @stat are needed for sidebar
  # but because only admin can create new account so @user needs to be Admin
  def new
    @user = Admin.find(session[:user_id])
    @stat = view_context.get_statistics    
    @partner = Partner.new
  end

  def create
    #authenticate_user
#@user = Admin.find(session[:user_id])
#@stat = view_context.get_statistics    
    @partner = Partner.new(params[:partner])
    if @partner.save
      @partner.reactivate
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
    @stat = view_context.get_statistics()
  end

end
