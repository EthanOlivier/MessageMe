class ChatroomController < ApplicationController
  before_action :require_user
  
  def index
    @message = Message.new
    @messages = Message.paginate(page: params[:id], per_page: 25)
  end
end 