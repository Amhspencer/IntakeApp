class AdminsController < ApplicationController

  def show
    authenticate_user
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


  #def new
    #@admin = Admin.new
  #end

  def create
    authenticate_user
    @admin = Admin.create!(params[:admin])  #What's the params here?
    #@admin.admin = 1
    @admin.save!
    if @admin.save
      flash[:success] = "Admin created successfully!"
      redirect_to admin_path(session[:user_id])
    else
      render 'new'
    end
  end

  #call this method first to make sure only admin can perform the action
  def authenticate_user
    if !session[:user_id]
      redirect_to login_path
    else
      if session[:user_role] == :admin  && params[:id].to_i != session[:user_id]
        redirect_to admin_path session[:user_id]
      elsif session[:user_role] == :partner
        redirect_to partner_path session[:user_id]
      elsif session[:user_role] == :staff
        redirect_to staff_path session[:user_id]
      end
    end
  end

end


