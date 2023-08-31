class ChatroomsController < ApplicationController
  def index
    if params[:recipient] && User.find_by(id: params[:recipient])
      @participants = [current_user.id, params[:recipient].to_i].sort
      Chatroom.create!(participant_ids: @participants) unless Chatroom.where(participant_ids: @participants).any?
    end
    @chatrooms = Chatroom.where("? = ANY (participant_ids)", current_user.id)
    # TODO: Within the index, the user can click on a shatroom and display its contents.
  end

  def show
    @chat = Chatroom.find(params[:id])
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "show", locals: { chat: @chat }, formats: [:html] }
    end
  end
end
