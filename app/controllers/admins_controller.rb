class AdminsController < UsersController

  def show
    form_sorting_for_show()
    @user = Admin.find(params[:id])
  end


  def create
    @admin = Admin.create!(params[:admin])
    @admin.reactivate
    @admin.save!
    if @admin.save
      flash[:success] = "Admin created successfully!"
      redirect_to admin_path(session[:user_id])
    # else
    #   render 'new'
    end
  end

  def deactivate
    if params[:deactivate] then
      @user = User.find(params[:deactivate]).deactivate
    end
    if params[:reactivate] then
      @user = User.find(params[:reactivate]).reactivate
    end
    @active_users = User.find_all_by_active(true)
    @inactive_users = User.find_all_by_active(false)
  end

end


