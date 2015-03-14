class PartnersController < ApplicationController
  def new
    #@partner = Partner.new
  end

  def create
    @partner = Partner.create!(params[:partner])
    if @partner.save
      flash[:success] = "Partner created successfully!"
      redirect_to admin_path(session[:user_id])
    else
      render 'new'
    end
  end
  
  def show
  end
end
