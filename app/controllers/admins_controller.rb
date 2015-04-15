class AdminsController < UsersController

  def show
    #authenticate_user
    id = params[:id]
    unprocessed = (!params[:unproc_sort] && session[:unproc_sort])
    processed = (!params[:proc_sort] && session[:proc_sort])
    if unprocessed || processed then
      flash.keep
      redirect_to :action => "show",
                  :id => session[:user_id],
                  :unproc_sort => (unprocessed ? session[:unproc_sort] : params[:unproc_sort]),
                  :proc_sort => (processed ? session[:proc_sort] : params[:proc_sort])
    end
    session[:unproc_sort] = params[:unproc_sort]
    session[:proc_sort] = params[:proc_sort]
    @admin = Admin.find(id)
    @unprocessedForms = Form.where(:processed => false).order(session[:unproc_sort])
    @processedForms = Form.where(:processed => true).order(session[:proc_sort])
  end


  def create
    #authenticate_user
    @admin = Admin.create!(params[:admin])  #What's the params here?
    @admin.save!
    if @admin.save
      flash[:success] = "Admin created successfully!"
      redirect_to admin_path(session[:user_id])
    else
      render 'new'
    end
  end


end


