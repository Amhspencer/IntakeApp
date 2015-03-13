class AdminsController < ApplicationController

  def show
    id = params[:id]
    @admin = Admin.find(id)
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.create!(params[:admin])
    if @admin.save
      flash[:success] = "Admin created successfully!"
      redirect_to login_path
    else
      render 'new'
    end
  end

end


