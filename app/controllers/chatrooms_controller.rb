class ChatroomsController < ApplicationController
  def index
    if params[:recipient] && User.find_by(id: params[:recipient])
      @participants = [current_user, User.find(params[:recipient])]
      Chatroom.create!(users: @participants) unless Chatroom.exists_for_users?(@participants)
      @chatroom = Chatroom.find_by_users(@participants)
      @messages = @chatroom.messages
    end
    @jam = Jam.new
    @chatrooms = current_user.recent_chatrooms
                             .includes(:messages)
                             .where.not(messages: { id: nil })
                             .order('messages.created_at ASC')
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    redirect_to chats_path and return unless @chatroom.users.include?(current_user)

    @jam = Jam.new
    @messages = @chatroom.messages
    @recipient = @chatroom.recipient(current_user)
  end
end
