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
    UserGenre.create!(
      user: current_user,
      genre_id: params[:genre].to_i
    )
    redirect_to profile_path(current_user)
  end

  def update_instrument
    instrument = Instrument.create(user_instrument_params)
    UserInstrument.create!(
      user: current_user,
      instrument: instrument
    )
    redirect_to profile_path(current_user)
  end

  def show
    @profile = User.find(params[:id])
  end

  def update_cl_images
    current_user.update(user_images_params)
    redirect_to profile_path(current_user)
  end

  def update_cl_audios
    current_user.update(user_audios_params)
    redirect_to profile_path(current_user)
  end

  private

  def user_instrument_params
    params.require(:instrument).permit(:name,:category)
  end

  def user_images_params
    params.require(:user).permit(cl_images: [])
  end

  def user_audios_params
    params.require(:user).permit(cl_audios: [])
  end
end
