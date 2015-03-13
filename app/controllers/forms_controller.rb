class FormsController < ApplicationController

  def show
    id = params[:id]
    @form = Form.find(id)
    # Should render the default show route
  end



  def new    
  end

  def create
    @form = Form.create!(params[:form])
    @form.processed = false
    @form.save!
    # Redirect to the end page, for now redirects to a show that form
    redirect_to form_path(@form)
  end


  def disclaimer
  end

  def confirmation
  end
  
  def showToAdmin
    @form = Form.find(params[:id])
  end


  def showToProcess
    @form = Form.find(params[:id])
  end

  def processForm
    @form = Form.find(params[:id])
    @form.processed = true
    @form.save!
    redirect_to admin_path(session[:user_id])
  end

end

