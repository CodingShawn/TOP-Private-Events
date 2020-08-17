class SessionsController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def new
  end

  def create
    if user = User.find_by_username(params[:username])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      redirect_to '/login', notice: "Incorrect username"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login', notice: "Logged out!"
  end
end
