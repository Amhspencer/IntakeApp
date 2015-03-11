class FormController < ApplicationController

  def show
    id = params[:id]
    @form = Form.find(id)
    # Should render the default show route
  end



  def new
    
  end

  def create
    @form = Form.create!(params[:form])
    # Redirect to the end page, for now redirects to a show that form
    redirect_to form_path(@form)
  end

end
