class ChatroomsController < ApplicationController
  def index
    if params[:recipient] && User.find_by(id: params[:recipient])
      @participants = [current_user.id, params[:recipient].to_i].sort
      Chatroom.create!(participant_ids: @participants) unless Chatroom.where(participant_ids: @participants).any?
    end
    @chatrooms = Chatroom.where("? = ANY (participant_ids)", current_user.id)
    @jam = Jam.new
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
