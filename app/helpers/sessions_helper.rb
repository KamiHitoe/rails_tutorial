module SessionsHelper
  
  # login with sent user_id
  def log_in(user)
    session[:user_id] = user.id
  end

  # persist user's session
  def remember(user)
    # publish remember_digest by remember_token
    user.remember
    # send user_id to cookie
    cookies.permanent.signed[:user_id] = user.id
    # send remember_token to cookie
    cookies.permanent[:remember_token] = user.remember_token
  end

  # delete cookie by user
  def forget(user)
    user.forget # call from user.rb
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # return involved in user instance with remember token
  def current_user
    # conditional and assign
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end
  
  # return true or false
  def logged_in?
    !current_user.nil?
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

end
