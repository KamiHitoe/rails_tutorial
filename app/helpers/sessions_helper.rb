module SessionsHelper
  
  # login with sent user_id
  def log_in(user)
    session[:user_id] = user.id
  end

  # return logged in user instance
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  
  # return true or false
  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
