class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @profiles = User.last(5)
  end

  def dashboard
  end
end
