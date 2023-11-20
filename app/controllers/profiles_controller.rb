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

  def update_genre
    genre_params = params[:genre]["list"].split(",")
    current_user.genres = genre_params.map { |g| Genre.where(name: g).first_or_create }
    redirect_to profile_path(current_user)
  end

  def update_instrument
    # raise
    # sanitize_instrument_params
    # user_instrument_params
    current_user.instruments = user_instrument_params
    redirect_to profile_path(current_user)
  end

  def show
    @profile = User.find(params[:id])
  end

  def update_cl_images
    user_images_params
    current_user.cl_images.attach(params[:user][:cl_images]) if params.dig(:user, :cl_images).present?
    redirect_to profile_path(current_user)
  end

  private

  def user_instrument_params
    JSON.parse(params.require(:user).permit(:instruments)[:instruments])
      .map { |i| {name: i[0], category: i[1]} }
      .map { |p| Instrument.where(p).first_or_create }
  end

  def user_images_params
    params.require(:user).permit(cl_images: [])
  end

end
