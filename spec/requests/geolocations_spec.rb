require 'rails_helper'

describe 'Geolocations API', type: :request do
  it 'returns empty array of locations' do
    get '/api/v1/geolocations'

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to eq(0)
  end

  it 'returns all loctions' do
    FactoryBot.create(:geolocation, ip_address: "46.186.21.63", location: "Mielec")
    FactoryBot.create(:geolocation, ip_address: "46.180.21.60", location: "Kemerovo")

    get '/api/v1/geolocations'

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to eq(2)
    expect(JSON.parse(response.body)[0]["location"]).to eq("Mielec")
  end
end