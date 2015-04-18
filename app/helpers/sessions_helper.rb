module SessionsHelper
  # Logs in the given user.
  def log_in(user)

    session[:user_id] = user.id
    if user.type == "Admin"
      session[:user_role] = :admin
    elsif user.type == "Partner"
      session[:user_role] = :partner
    elsif user.type == "Staff"
      session[:user_role] = :staff
    end
  end


  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    session.delete(:user_role)
    @current_user = nil
  end
  
  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.where(id: session[:user_id]).first
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end


  def redirect_to_user(id)
    if is_admin_session?
      redirect_to admin_path id and return
    elsif is_partner_session?
      redirect_to partner_path id and return
    elsif is_staff_session?
      redirect_to staff_path id and return
    end
  end


  def is_admin_session?
    return session[:user_role] == :admin
  end

  def is_partner_session?
    return session[:user_role] == :partner
  end

  def is_staff_session?
    return session[:user_role] == :staff
  end

  def is_active?
    return User.where(id: session[:user_id]).first.active
  end

end
