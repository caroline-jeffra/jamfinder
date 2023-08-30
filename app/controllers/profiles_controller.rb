class ProfilesController < ApplicationController
  def index
    @profiles = User.where.not(id: current_user)
    # TODO: account for search filters
    @markers = @profiles.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end

  def show
    @profile = User.find(params[:id])
  end
end
