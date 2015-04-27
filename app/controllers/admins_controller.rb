class AdminsController < UsersController

  def show
    form_sorting_for_show()
    @user = Admin.find(session[:user_id])
    @stat = view_context.get_statistics    
  end

  # In case I forgot why do I need new, create, and else -> render 'new', @admin = Admin.new ...
  # It's for sanitizing input and printing out errors
  # Also we don't call create!(line 22) on new object because we need to validate input before creating it
  # http://guides.rubyonrails.org/getting_started.html ==> 5.10 Adding Validation
  def new
    @user = Admin.find(session[:user_id])
    @stat = view_context.get_statistics    
    @admin = Admin.new
  end

  def create
    @user = Admin.find(session[:user_id])
    @stat = view_context.get_statistics    
    @admin = Admin.new(params[:admin])
    if @admin.save
      @admin.reactivate
      flash[:success] = "Admin created successfully!"
      redirect_to admin_path(session[:user_id])
    else
       render 'new'
    end
  end

  def manage_accounts
    @user = Admin.find(session[:user_id])
    @stat = view_context.get_statistics    
    if params[:deactivate] then
      User.find(params[:deactivate]).deactivate
    end
    if params[:reactivate] then
      User.find(params[:reactivate]).reactivate
    end
    @active_users = User.find_all_by_active(true)
    @inactive_users = User.find_all_by_active(false)
  end
end


