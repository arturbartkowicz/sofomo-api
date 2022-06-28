class FetchGeolocationData
  include Dry::Transaction
  include HTTParty

  step :validate_ip
  step :fetch_geolocation

  def validate_ip(ip)
    IPAddr.new(ip)
    Success(ip)

    rescue IPAddr::InvalidAddressError => _error
    Failure("IP address is incorrect")
  end

  def fetch_geolocation(ip)
    @response = GeolocationsService.new.fetch_api_data(ip)

    case @response.code
      when 200
        response = JSON.parse(@response.body)
        result = {
          ip_address: response['ip'],
          location: response['city'].nil? ? "We couldn't find location" : response['city']
        }

        Success(result)
      when 400...600
        Failure(["Cannot fetch your location"])
    end
  end
end