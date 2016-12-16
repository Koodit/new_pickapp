class Api::ApiController < ApplicationController
  before_action :authenticate_user!

  serialization_scope :view_context

  respond_to :json
end
