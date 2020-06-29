class UsersController < ApplicationController

  def new
    @user= User.new
  end

  def create
    @user= User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render new_user_path
    end
  end

  def show
    redirect_if_not_logged_in
    @user= User.find_by(id: params[:id])
    redirect_to '/' if !@user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email)
  end

end
