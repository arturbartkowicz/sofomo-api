Rails.application.routes.draw do
  match "/404", :to => "errors#route_not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
  
  namespace :api do
    namespace :v1 do
      resources :geolocations, only: %i[index create destroy]
    end
  end
end
