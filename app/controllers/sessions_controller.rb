class SessionsController < ApplicationController

  def create
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:message] = "Sign In Not Found. Please enter valid username and password."
      redirect_to "/signin"
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
