class Api::V1::GeolocationsController < ApplicationController
  def index
      @geolocations = Geolocation.all
      render json: @geolocations
  end

  def create
    # Implementacja Transakcji. Jako argument do niej, przekazywany będzie 'geolocation_params[:ip_address]'
    # find by or create

    @geolocation = Geolocation.new(ip_address: geolocation_params[:ip_address], location: "Rzeszów")
    if @geolocation.save
      render json: @geolocation
    else
      render error: {error: 'Unable to create geolocation'}, status: 400
    end
  end
end

private 

def geolocation_params
  params.require(:geolocation).permit(:ip_address)
end