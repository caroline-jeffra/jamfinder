class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    if params[:query].present?
      @profiles = User.search(params[:query])
    else
      @profiles = User.where.not(id: current_user)
    end
    if params[:distance].present? && params[:distance].to_i != 100 && current_user.present?
      @profiles = @profiles.near(user_coordinates, params[:distance], units: :km)
    end
    @markers = @profiles.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window_html: render_to_string(partial: "layouts/mapbox_info_window", locals: {user: user}),
        marker_html: render_to_string(partial: "layouts/mapbox_marker", locals: {user: user})
      }
    end
  end

  def update_bio
    current_user.bio = params[:bio]
    current_user.save
    redirect_to profile_path(current_user)

  end

  def show
    @profile = User.find(params[:id])
  end
end
