helpers do
  def logged_in?
    session[:user_id] != nil
  end

  def active_user
    if logged_in?
      return @active_user ||= User.find_by(id: session[:user_id])
    end
    nil
  end

  def authentication_required
  	redirect '/404' if !logged_in?
  end
end


