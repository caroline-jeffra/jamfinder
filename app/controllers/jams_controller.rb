class JamsController < ApplicationController
  def create
    @jam = Jam.new(jam_params)
    puts jam_params
    if @jam.save
      flash.alert = "Jam booked!"
      participants = params[:jam][:participants].split
      participants.each do |participant|
        jam_join = UserJam.new
        jam_join.user = User.find(participant.to_i)
        jam_join.jam = @jam
        if jam_join.save
          puts "#{jam_join} saved"
        else
          puts "jam_join not saved :((((((("
        end
      end
      raise
      # TODO: collapse toggleable
    else
      flash.alert = "Please enter a date and time in the future."
    end
  end

  private

  def jam_params
    # TODO: permit params
    params.require(:jam).permit(:date, :address)
  end
end
