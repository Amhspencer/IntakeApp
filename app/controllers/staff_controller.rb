class StaffController < UsersController


  def show
    form_sorting_for_show() 
    @staff = Staff.find(params[:id])
  end



  def create
    @staff = Staff.create!(params[:staff])
    if @staff.save
      flash[:success] = "Staff created successfully!"
      redirect_to staff_path(session[:user_id])
    else
      render 'new'
    end
  end



end
