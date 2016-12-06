class ApplicationController < ActionController::Base
  # include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  # do not use CSRF for CORS options
  skip_before_filter :verify_authenticity_token, only: [:options]

  def options
    render :text => '', :content_type => 'text/plain'
  end

  serialization_scope :view_context

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

  def paperclip_object_from_base64(base64_data, filename, filetype)
    paperclip_object = StringIO.open(Base64.strict_decode64(base64_data))
    paperclip_object.class_eval do
      attr_accessor :content_type, :original_filename
    end
    paperclip_object.original_filename = filename
    paperclip_object.content_type = filetype

    paperclip_object
  end
end
