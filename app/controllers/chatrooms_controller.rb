class ChatroomsController < ApplicationController
  def index
    if params[:recipient] && User.find_by(id: params[:recipient])
      @participants = [current_user, User.find(params[:recipient])]
      Chatroom.create!(users: @participants) unless Chatroom.private_chatroom_exists?(@participants.first, @participants.last)
      @chatroom = Chatroom.find_private_chatroom(@participants.first, @participants.last)
    end
    @jam = Jam.new
    @chatrooms = current_user.chatrooms
                             .includes(:messages)
                             .order('messages.created_at DESC')
                             .where.not(messages: { id: nil })
  end

  def show
    @chat = Chatroom.find(params[:id])
    @jam = Jam.new
    respond_to do |format|
      format.html { render partial: "show", locals: { chat: @chat }, formats: [:html] }
      format.text { render partial: "show", locals: { chat: @chat }, formats: [:html] }
    end
  end
end
