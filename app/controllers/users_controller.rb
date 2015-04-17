class UsersController < ApplicationController
  # show user's profile based on the ID, if not logged in the redirect to login
   
  before_filter :authenticate_user

  def show
    id = params[:id]
    @user = User.find(id)
    if (@user.type == "Admin")
      redirect_to admin_path id
    elsif (@user.type == "Staff")
      redirect_to staff_path id
    else (@user.type == "Partner")
      redirect_to partner_path id
    end
  end
  
  # when someone visits /users/ it will automatically redirect to login
  def index
  	redirect_to login_path
  end

  # create new user, either Admin or Partner
  def new
  end

  def create
  end

  def authenticate_user
    if !session[:user_id]
      redirect_to login_path
    else
      redirect_to_session_id
    end
  end

  def redirect_to_session_id
    if params_and_session_inconsistent
      if session[:user_role] == :admin  
        redirect_to admin_path session[:user_id] and return
      elsif session[:user_role] == :partner
        redirect_to partner_path session[:user_id] and return
      elsif session[:user_role] == :staff
        redirect_to staff_path session[:user_id] and return
      end
    end
  end

  def params_and_session_inconsistent
    return params[:id] && params[:id].to_i != session[:user_id]
  end
  
#Helper method for admin and partner show. There may be a better place for it, but I (Michael) this this is
#appropriate.  Not sure exactly how the helper modules are intended to be used or how to use them properly.
  def form_sorting_for_show
    sorting_redirect
    session[:unproc_sort] = params[:unproc_sort]
    session[:proc_sort] = params[:proc_sort]
    @unprocessedForms = Form.where(:processed => false).order(session[:unproc_sort])
    @processedForms = Form.where(:processed => true).order(session[:proc_sort])
  end

  #Dante, please help me (Michael) rename this method.  
  #I don't have a clear understanding about what it's doing
  def sorting_redirect 
    unprocessed = (!params[:unproc_sort] && session[:unproc_sort]) #not params, but is a session
    processed = (!params[:proc_sort] && session[:proc_sort])
    if unprocessed || processed then
      flash.keep
      redirect_to :action => "show",
                  :id => session[:user_id],
                  :unproc_sort => (unprocessed ? session[:unproc_sort] : params[:unproc_sort]),
                  :proc_sort => (processed ? session[:proc_sort] : params[:proc_sort])
    end
  end

end
