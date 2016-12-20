class Api::ApiController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
  
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  serialization_scope :view_context
  respond_to :json
end
