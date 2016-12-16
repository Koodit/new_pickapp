class Api::DeviseTokenAuth::OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!
  
  def assign_provider_attrs(user, auth_hash)
    user.assign_attributes({
      first_name:     auth_hash['info']['first_name'],
      last_name:     auth_hash['info']['last_name'],
      email:    auth_hash['info']['email']
    })
  end
end
