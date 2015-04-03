class AdminsController < ApplicationController

  def show
    authenticate_user
    id = params[:id]
    if !params[:sort] && session[:sort] then
      flash.keep
      redirect_to :action => "show", :id => session[:user_id], :sort => session[:sort]
    end
    @admin = Admin.find(id)
    @unprocessedForms = Form.where(:processed => false)
    @processedForms = Form.where(:processed => true).order(session[:sort]);
    session[:sort] = params[:sort]
  end


  #def new
    #@admin = Admin.new
  #end

  def create
    authenticate_user
    @admin = Admin.create!(params[:admin])
    @admin.admin = 1
    @admin.save!
    if @admin.save
      flash[:success] = "Admin created successfully!"
      redirect_to admin_path(session[:user_id])
    else
      render 'new'
    end
  end

  # call this method first to make sure only admin can perform the action
  def authenticate_user
    if !session[:user_id]
      redirect_to login_path
    elsif session[:user_role] == :partner
      redirect_to static_pages_notadmin_path
    end
  end

end


