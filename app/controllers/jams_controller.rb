class JamsController < ApplicationController
  def create
    @jam = Jam.new(jam_params)
    puts jam_params
    participant_ids = params[:jam][:participants].split
    participants = [User.find(participant_ids.first.to_i), User.find(participant_ids.last.to_i)]
    @jam.users = participants
    recipient_id = (participant_ids - [current_user.id.to_s]).first
    if @jam.save
      flash.alert = "Jam booked!"
      redirect_to chats_path(recipient: recipient_id)
      return
    end
  end

  private

  def jam_params
    params.require(:jam).permit(:date, :address)
  end
end
