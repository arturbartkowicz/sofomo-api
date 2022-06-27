class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound,       with: :resource_not_found
  rescue_from ActionController::ParameterMissing, with: :parameter_missing

  def resource_not_found
    render json: {error: "Resource not found"}, status: :not_found
  end

  def parameter_missing
    render json: {error: "You must provide a parameter for this request"}, status: :not_found
  end
end
