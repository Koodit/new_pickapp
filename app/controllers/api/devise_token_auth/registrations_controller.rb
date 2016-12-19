class Api::DeviseTokenAuth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  before_action :configure_permitted_parameters
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname, :birth_date, :address, :comune, :prov, :nickname, :image])
  end
end
