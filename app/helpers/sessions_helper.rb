

module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
    session[:commune_id] = user.community_id
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= Resident.where(id: session[:user_id], community_id: session[:commune_id])
  end

  # Returns the commune associated to the current logged-in user (if any).
  def current_commune
    @current_commune ||= Community.where(id: session[:commune_id])
  end

  def log_out
    session.delete(:user_id)
    session.delete(:commune_id)
    @current_user = nil
    @current_commune = nil
  end

end
