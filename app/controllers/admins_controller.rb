class AdminsController < ApplicationController

  def show
    id = params[:id]
    @admin = Admin.find(id)
    @unprocessedForms = Form.where(:processed => false)
    @processedForms = Form.where(:processed => true)
  end


  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.create!(params[:admin])
    if @admin.save
      flash[:success] = "Admin created successfully!"
      redirect_to admin_path(@admin)
    else
      render 'new'
    end
  end


end


