class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # automatically log in the new user
      log_in(@user)
      # update the messages for page alerts
      flash[:success] = "Welcome to the #{APP_NAME}!"
      # redirect to the user page
      redirect_to user_url(@user)
    else
      # redisplay the signup form
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:name,
                                   :email,
                                   :password,
                                   :password_confirmation)
    end

end
