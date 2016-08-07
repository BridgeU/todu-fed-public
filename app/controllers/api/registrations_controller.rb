class Api::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  def create
    user = User.new(sign_up_params)
    if user.save
      render :json=> {:auth_token=>user.auth_token, email: user.email}, :status=>201
      return
    else
      warden.custom_failure!
      render :json=> user.errors, :status=>422
    end
  end

  # Devise will assume "api_user" by default otherwise
  def resource_name
    :user
  end
end
