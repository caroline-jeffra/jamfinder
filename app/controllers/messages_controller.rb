class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    if @message.save
      redirect_to chats_path
    else
      render "chats", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :chatroom_id, :content)
  end
end
