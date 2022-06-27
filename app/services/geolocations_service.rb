class GeolocationsService
  include HTTParty
  #Move access_key to the .env file
  BASE_URL = "http://api.ipstack.com/"
  ACCESS_KEY_PARAM = "?access_key=600ed8989e5001e435fc5ba4cfebcb47"

  def fetch_api_data(ip)
    path = BASE_URL + ip + ACCESS_KEY_PARAM
    response = HTTParty.get(path)
  end
end