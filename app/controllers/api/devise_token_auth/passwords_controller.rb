class Api::DeviseTokenAuth::PasswordsController < DeviseTokenAuth::PasswordsController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!
end
