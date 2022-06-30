require 'rails_helper'

describe 'Geolocations API', type: :request do
  describe 'GET /geolocations' do
    before do
      FactoryBot.create(:geolocation, ip_address: "46.186.21.63", location: "Mielec")
      FactoryBot.create(:geolocation, ip_address: "46.180.21.60", location: "Kemerovo")
    end

    it 'returns all ips and loctions' do
      get '/api/v1/geolocations'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
      expect(JSON.parse(response.body)[0]["location"]).to eq("Mielec")
    end
  end

  describe 'POST /geolocations' do
    it 'creates a new geolocation based on provided ip' do
      expect{
        post '/api/v1/geolocations', params: {geolocation: {ip_address: "46.220.21.63"}}
      }.to change { Geolocation.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /geolocations/ip' do
    #with a '!' bang character we make sure that the record is first created, before test will run
    let!(:geolocation) { FactoryBot.create(:geolocation, ip_address: "46.186.21.63", location: "Mielec") }

    it 'deletes a geolocation based on provided ip' do
      expect{
        delete '/api/v1/geolocations/ip', params: {geolocation: {ip_address: geolocation.ip_address}}
    }.to change { Geolocation.count }.from(1).to(0)

      expect(response).to have_http_status(:ok)
    end

    it 'does not delete a geolocation based on provided ip' do
      expect{
        delete '/api/v1/geolocations/ip', params: {geolocation: {ip_address: "46.186.21.61"}}
    }.to_not change { Geolocation.count }

      expect(response).to have_http_status(:bad_request)
    end
  end
end 