class AdminsController < ApplicationController

  def show
    id = params[:id]
    @admin = Admin.find(id)
  end

end


