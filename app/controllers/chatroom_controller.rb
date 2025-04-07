class ChatroomController < ApplicationController
  before_action :require_user
  
  def index
    @messages = Message.paginate(page: params[:id], per_page: 5)
  end
end