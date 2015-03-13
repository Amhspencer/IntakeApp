class AdminsController < ApplicationController

  def show
    id = params[:id]
    @admin = Admin.find(id)
    @allforms = Form.where(:processed => false)
  end





end


