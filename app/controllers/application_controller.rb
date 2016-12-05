class ApplicationController < ActionController::Base
  # include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def check_for_mobile
    session[:mobile_override] = params[:mobile] if params[:mobile]
    send_to_mobile if mobile_device?
  end

  def mobile_device? 
    (request.user_agent =~ /Mobile|webOS/) && (request.user_agent !~ /iPad/) || session[:mobile_override] == "true" # Season this regexp to taste. I prefer to treat iPad as non-mobile.
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname, :birth_date, :nickname, :address, :comune, :prov, :zip_code])
  end
end
