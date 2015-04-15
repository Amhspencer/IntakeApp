class StaffController < ApplicationController


  #This is the same as the admins_controller show method - maybe there is a way to DRY this out
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
    @staff = Staff.find(id)
    @unprocessedForms = Form.where(:processed => false).order(session[:unproc_sort])
    @processedForms = Form.where(:processed => true).order(session[:proc_sort])
  end



  def create
    #authenticate_user
    @staff = Staff.create!(params[:staff])
    if @staff.save
      flash[:success] = "Staff created successfully!"
      redirect_to staff_path(session[:user_id])
    else
      render 'new'
    end
  end



end
