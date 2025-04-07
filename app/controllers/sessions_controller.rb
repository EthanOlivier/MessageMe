class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      flash[:notice] = "Logged in successfully"
      redirect_to chatroom_path
    else
      flash[:alert] = "Incorrect username or password entered. Please try again."
      render "new"
    end
  end
end