class SessionsController < ApplicationController
  
  def new
    redirect_to root_path if current_user
  end
  
  def create
    user = User.where(email: params[:email]).first
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You are now logged in."
      redirect_to root_path
    else
      flash[:error] = "There's something wrong with your username or password."
      redirect_to login_path
    end
  end
  
end