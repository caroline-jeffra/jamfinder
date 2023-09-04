class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @chatroom = @message.chatroom
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        message: render_to_string(partial: "message", locals: { message: @message }),
        sender_id: @message.user.id
      )
      head :ok
    else
      render "chats", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:chatroom_id, :content)
  end
end
