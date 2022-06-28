class GeolocationsService
  include HTTParty
  BASE_URL = "http://api.ipstack.com/"
  ACCESS_KEY_PARAM = "?access_key=#{ENV["ACCESS_KEY"]}"

  def fetch_api_data(ip)
    path = BASE_URL + ip + ACCESS_KEY_PARAM
    response = HTTParty.get(path)
  end
end