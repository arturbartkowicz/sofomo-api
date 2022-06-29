require 'rails_helper'

describe 'Geolocations API', type: :request do
  it 'returns all loctions' do
    get '/api/v1/geolocations'

    expect(response).to have_http_status(:success) 
  end
end