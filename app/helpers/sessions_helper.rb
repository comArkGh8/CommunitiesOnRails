

module SessionHelper

  def log_in(user)
    session[:user_id] = user.id
    session[:commune_id] = user.community_id
  end
end
