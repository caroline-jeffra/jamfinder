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
    current_user.genres = format_user_genres_params
    redirect_to profile_path(current_user)
  end

  def update_instrument
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

  def user_genres_params
    params.require(:user).permit(:genres)
  end

  def format_user_genres_params
    user_genres_params[:genres].split(",")
      .map { |g| Genre.where(name: g).first_or_create }
  end

  def user_instruments_params
    params.require(:user).permit(:instruments)
  end
  
  def format_user_instruments_params
    JSON.parse(user_instruments_params[:instruments])
      .map { |i| {name: i[0], category: i[1]} }
      .map { |p| Instrument.where(p).first_or_create }
  end

  def user_images_params
    params.require(:user).permit(cl_images: [])
  end

end
