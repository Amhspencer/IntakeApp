class PartnersController < UsersController

  def create
    #authenticate_user
    @partner = Partner.create!(params[:partner])
    if @partner.save
      flash[:success] = "Partner created successfully!"
      redirect_to admin_path(session[:user_id])
    else
      render 'new'
    end
  end
  
  def show
    id = params[:id]
    @user = Partner.find(id)

    need_to_sort = params[:partner_sort] || session[:partner_sort]

    if need_to_sort
      @all_forms = @user.forms.order(params[:partner_sort])
      session[:partner_sort] = params[:partner_sort]
    else
      @all_forms = @user.forms  
    end
  end

end
