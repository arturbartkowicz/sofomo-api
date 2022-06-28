class ErrorsController < ActionController::Base
  #with parameter is the forgery_protection_strategy parameter, 
  #it tells Rails how to behave when a CSRF attack is identified.
  protect_from_forgery with: :null_session

  def route_not_found
    render json: {error: "Route not found"}, status: :not_found
  end

  def internal_server_error
    render json: {error: "Internal server error"}, status: 500
  end
end