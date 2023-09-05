class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
    @profiles = User.last(5)
  end

  def dashboard
    @user = current_user
    @jams = current_user.jams
    @jams = @jams.includes(:users)
    @jams = @jams.order(date: :asc)
    @months = month_list(@jams)
  end

  private

  def month_list(scheduled_jams)
    months = []
    scheduled_jams.each do |jam|
      unless months.include? jam.date.mon
        months << jam.date.mon
      end
    end
    return months
  end
end
