class Api::ApiController < ApplicationController
  before_filter :authenticate_user!

  serialization_scope :view_context

  respond_to :json

  def authenticate_admin_user!
    unless current_user.role == "administrator"
      render :json => {:error => "Authorized users only."}.to_json, :status => 403
    end
  end
end
