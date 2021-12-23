class UsersController < ApplicationController
  # define actions
  # send @user to View
  # send params to Model
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    # true and save
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!" # send alert message
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private
    def user_params
      # it must be located later than actions
      # params.require(:model).permit(:columns)
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  
  
end
