class UsersController < ApplicationController
  # show user's profile based on the ID, if not logged in the redirect to login
   
  before_filter :authenticate_user

  def show
    id = params[:id]
    @user = User.find(id)
    if (@user.type == "Admin")
      redirect_to admin_path params
    elsif (@user.type == "Staff")
      redirect_to staff_path params
    else (@user.type == "Partner")
      redirect_to partner_path params
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


###
#Authenticate Code
###
  def authenticate_user
    if !session[:user_id]
      redirect_to login_path
    elsif params_and_session_inconsistent
      redirect_to_user(session[:user_id])
    end
  end


  def params_and_session_inconsistent
    return params[:id] && params[:id].to_i != session[:user_id]
  end
  

###
#Sorting Code
###

#Helper method for admin and partner show. There may be a better place for it, but I (Michael) this this is
#appropriate.  Not sure exactly how the helper modules are intended to be used or how to use them properly.
  def form_sorting_for_show
    if missing_params then
      redirect_when_missing_params
    end
    session[:unproc_sort] = params[:unproc_sort]
    session[:proc_sort] = params[:proc_sort]
    @unprocessedForms = Form.where(:processed => false).order(session[:unproc_sort])
    @processedForms = Form.where(:processed => true).order(session[:proc_sort])
  end

  def redirect_when_missing_params
      flash.keep
      redirect_to :action => "show",
                  :id => session[:user_id],
                  :unproc_sort => (params[:unproc_sort] ? params[:unproc_sort] : session[:unproc_sort]),
                  :proc_sort => (params[:proc_sort] ? params[:proc_sort] : session[:proc_sort])
  end

  def missing_params
    unprocessed = (!params[:unproc_sort] && session[:unproc_sort])
    processed = (!params[:proc_sort] && session[:proc_sort])
    return unprocessed || processed
  end

  def get_statistics
    stat = Hash.new
    stat[:total_active] = (User.find_all_by_active(true)).length
    stat[:total_inactive] = (User.find_all_by_active(false)).length
    stat[:total_user] = (User.all).length
    stat[:total_admin] = (User.find_all_by_type("Admin")).length
    stat[:total_staff] = (User.find_all_by_type("Staff")).length
    stat[:total_partner] = (User.find_all_by_type("Partner")).length
    stat[:total_processed] = (Form.find_all_by_processed(true)).length
    stat[:total_unprocessed] = (Form.find_all_by_processed(false)).length
    stat[:total_form] = (Form.all).length
    stat[:total_processed_user] = (@user.forms.select{ |f| f.processed == true }).length
    stat[:total_unprocessed_user] = (@user.forms.select{ |f| f.processed == false }).length

    return stat
  end

end

