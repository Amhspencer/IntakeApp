class AdminsController < UsersController

  def show
    form_sorting_for_show()
    @admin = Admin.find(params[:id])
  end


  def create
    @admin = Admin.create!(params[:admin])
    @admin.save!
    if @admin.save
      flash[:success] = "Admin created successfully!"
      redirect_to admin_path(session[:user_id])
    # else
    #   render 'new'
    end
  end


end


