class ChatroomsController < ApplicationController
  def index
    if params[:recipient] && User.find_by(id: params[:recipient])
      @participants = [current_user, User.find(params[:recipient])]
      Chatroom.create!(users: @participants) unless Chatroom.exists_for_users?(@participants)
      @chatroom = Chatroom.find_by_users(@participants)
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
