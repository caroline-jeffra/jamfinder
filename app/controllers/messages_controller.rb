class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    return unless @message.save

    head :ok
  end

  private

  def message_params
    params.require(:message).permit(:chatroom_id, :content)
  end
end
