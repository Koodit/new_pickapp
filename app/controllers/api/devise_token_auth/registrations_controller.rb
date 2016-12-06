class Api::V1::DeviseTokenAuth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  before_action :configure_permitted_parameters
  skip_before_action :verify_authenticity_token

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
