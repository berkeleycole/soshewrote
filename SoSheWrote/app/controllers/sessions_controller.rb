class SessionsController < ApplicationController
  
  def create
    session[:password] = params[:password]
    flash[:notice] = "Successfully logged in"
    redirect_to articles_path
  end

  def destroy
    reset_session
    flash[:notice] = "Successfully logged out"
    redirect_to home_path
  end

  def new
  end
  
end
