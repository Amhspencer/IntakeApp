module SessionsHelper
  # Logs in the given user.
  def log_in(user)

    session[:user_id] = user.id
    if user.admin? #user.organization.nil? || user.organization.blank?
      session[:user_role] = :admin
    else
      session[:user_role] = :partner
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

end
