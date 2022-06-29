class Api::V1::GeolocationsController < ApplicationController
  include HTTParty

  def index
      @geolocations = Geolocation.all
      render json: @geolocations
  end

  def create
    transaction = FetchGeolocationData.new

    transaction.call(geolocation_params[:ip_address]) do |m|
      m.success do |address|
        @geolocation = Geolocation.find_or_initialize_by(address)
    
        if @geolocation.save
          render json: @geolocation
        else
          render json: {error: 'Unable to create geolocation'}, status: :bad_request
        end
      end

      m.failure do |error|
        render json: {error: error}, status: 400
      end
    end
  end

  def destroy
    @geolocation = Geolocation.find_by(ip_address: geolocation_params[:ip_address])
  
    if @geolocation
      @geolocation.destroy
      render json: {message: "Ip address: #{@geolocation.ip_address} was successfully deleted"}, status: :ok
    else
      render json: {error: "Unable to delete this ip address"}, status: :bad_request
    end
  end
end

private 

def geolocation_params
  params.require(:geolocation).permit(:ip_address)
end