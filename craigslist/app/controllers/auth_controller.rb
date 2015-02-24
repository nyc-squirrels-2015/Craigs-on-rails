class AuthController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:username])
    if user.save && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to categories_path
    else
      redirect_to login_path
    end
  end

  def signup
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to categories_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation)
  end
end
