class ApplicationController < ActionController::Base
  respond_to :json

  rescue_from CanCan::AccessDenied do |exception|
    render status: 403, json: { message: exception.message }
  end
end
