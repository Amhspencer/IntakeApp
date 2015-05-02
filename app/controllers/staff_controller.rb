class StaffController < UsersController


  def show
    form_sorting_for_show()
    @user = Staff.find(params[:id])
    @stat = view_context.get_statistics()
  end

  def new
    @user = Admin.find(session[:user_id])
    @stat = view_context.get_statistics    
    @staff = Admin.new
  end

  def create
#@user = Admin.find(session[:user_id])
#@stat = view_context.get_statistics    
    @staff = Staff.new(params[:staff])
    if @staff.save
      @staff.reactivate
      flash[:success] = "Staff created successfully!"
      redirect_to admin_path(session[:user_id])
    else
      render 'new'
    end
  end



end
