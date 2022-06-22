class Api::V1::GeolocationsController < ApplicationController
  def index
      render json: Geolocation.all
  end
end
