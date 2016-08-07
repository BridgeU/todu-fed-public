class Api::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    resource = warden.authenticate(auth_options)
    if resource
      render json: {auth_token: resource.auth_token}, :status=>201
    else
      render status: 406, json: {}
    end
  end

  def resource_name
    :user
  end
end
