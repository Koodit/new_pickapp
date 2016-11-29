class AdminController < ActionController::Base
  before_action :authenticate_admin_user!

  layout "admin"

  private

  def authenticate_admin_user!
    authenticate_user!
    if current_user.role != "administrator"
      redirect_to root_path
    end
  end
end
