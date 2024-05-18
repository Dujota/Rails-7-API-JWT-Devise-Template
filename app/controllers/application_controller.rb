# frozen_string_literal: true

class ApplicationController < ActionController::API # rubocop:disable Style/Documentation
  respond_to :json

  rescue_from CanCan::AccessDenied do |exception|
    render json: { error: exception.message }, status: :unauthorized
  end

  def not_found
    raise ActionController::RoutingError, 'Not Found'
  end
end
