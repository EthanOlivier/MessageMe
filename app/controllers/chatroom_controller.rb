class ChatroomController < ApplicationController
  def index
    @messages = Message.paginate(page: params[:id], per_page: 5)
  end
end