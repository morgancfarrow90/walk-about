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

  def google_signin
    @user= User.find_or_create_by(email: auth["info"]["email"]) do |user|
      user.username= auth["info"]["first_name"]
      user.password= SecureRandom.hex(10)
    end
    if @user.save
      session[:user_id]= @user.id
      redirect_to user_path(@user)
    else
      redirect_to 'sessions#home'
    end
  end

  def destroy
    session.delete("user_id")
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
