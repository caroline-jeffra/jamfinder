class JamsController < ApplicationController
  def create
    @jam = Jam.new(jam_params)
    puts jam_params
    if @jam.save
      flash.alert = "Jam booked!"
      puts "******* jam with users #{jam_params} *******"
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
