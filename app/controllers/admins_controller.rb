class AdminsController < ApplicationController

  def show
    id = params[:id]
    @admin = Admin.find(id)
    @unprocessedForms = Form.where(:processed => false)
    @processedForms = Form.where(:processed => true)
  end





end


