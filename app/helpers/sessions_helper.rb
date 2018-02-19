

module SessionHelper

  def log_in(user)
    session[:user_id] = user.id
    session[:commune_id] = user.community_id
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= Resident.where(id: session[:user_id], community_id: session[:commune_id])
  end

end
