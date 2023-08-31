class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @profiles = User.where.not(id: current_user)
    # TODO: account for search filters
  end

  def show
    @profile = User.find(params[:id])
  end
end
