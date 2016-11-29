class DriverDetailsController < ApplicationController
  before_action :set_driver_detail, except: [:new, :create]

  def show
  end

  def new
    @driver_detail = DriverDetail.new
  end

  def create
    @driver_detail = DriverDetail.new driver_detail_params
    @driver_detail.user_id = current_user.id

    if @driver_detail.save
      set_user_pending_verification(@driver_detail)
      redirect_to profile_path, notice: "Richiesta inviata con successo"
    else
      render :new
    end
  end

  def destroy
    if @driver_detail.destroy
      user.cancel_pending_driver_verification
    end
  end

  private

  def set_user_pending_verification(driver_detail)
    @user = current_user
    @user.pending_driver_verification = true
    @user.save
  end

  def set_driver_detail
    @driver_detail = current_user.driver_detail
  end

  def driver_detail_params
    params.require(:driver_detail).permit(
      :user_id, :patente, :assicurazione,:license_type,
      :license_number, :license_release_date,:license_expire_date,
      :license_release_city, :license_release_city_common
    )
  end

end
