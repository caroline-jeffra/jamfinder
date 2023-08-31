class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @profiles = User.where.not(id: current_user)
    # TODO: account for search filters
    @markers = @profiles.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window_html: render_to_string(partial: "layouts/mapbox_info_window", locals: {user: user}),
        marker_html: render_to_string(partial: "layouts/mapbox_marker", locals: {user: user})
      }
    end
  end

  def show
    @profile = User.find(params[:id])
  end
end
