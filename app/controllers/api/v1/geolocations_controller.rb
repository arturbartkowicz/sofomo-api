class Api::V1::GeolocationsController < ApplicationController
  def index
      @geolocations = Geolocation.all
      render json: @geolocations
  end

  def create
    # Implementacja Transakcji. Jako argument do niej, przekazywany będzie 'geolocation_params[:ip_address]'
    # find by or create

    transaction = GeolocationTransaction.new

    transaction.call(geolocation_params[:ip_address]) do |m|
      m.success do |address|
        @geolocation = Geolocation.find_or_initialize_by(address)
    
        if @geolocation.save
          render json: @geolocation
        else
          render json: {error: 'Unable to create geolocation'}, status: 400
        end
      end

      m.failure do |error|
        render json: {error: error}, status: 400
      end
    end
  end
end

private 

def geolocation_params
  params.require(:geolocation).permit(:ip_address)
end