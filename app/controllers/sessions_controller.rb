class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      ActiveUsers.add(current_user.username)
      flash[:success] = "Logged in successfully"
      redirect_to root_path
    else
      flash.now[:error] = "Incorrect username or password entered. Please try again."
      render "new"
    end
  end

  def destroy
    ActiveUsers.remove(current_user.username)
    session[:user_id] = nil
    flash[:success] = "Logged out successfully"
    redirect_to login_path, status: :see_other
  end
end