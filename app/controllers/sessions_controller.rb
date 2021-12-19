class SessionsController < ApplicationController
  # helper functions are automatically loaded
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # save session by user_id
      log_in user
      remember user
      redirect_to user # user_url(user)
    else
      # render flash only in current page
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
  
end
