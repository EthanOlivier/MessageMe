class UsersController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(username: params[:session][:username], password: params[:session][:password])
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the chatroom #{@user.username}"
      redirect_to root_path
    else
      flash[:alert] = "Failed to create new User Profile. Try a different username or password."
      render "new"
    end
  end
end