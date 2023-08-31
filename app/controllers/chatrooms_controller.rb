class ChatroomsController < ApplicationController
  def index
    # TODO: based on current_user, find all Chatroom IDs the user is attached to through the user_chatrooms table and display them
    @participants = [current_user.id, params[:recipient].to_i].sort
    Chatroom.create!(participant_ids: @participants) unless Chatroom.where(participant_ids: @participants).any?
    @chatrooms = Chatroom.where("? = ANY (participant_ids)", current_user.id)
    # TODO: Within the index, the user can click on a shatroom and display its contents.
  end
end
