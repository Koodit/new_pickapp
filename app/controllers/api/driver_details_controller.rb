class Api::DriverDetailsController < Api::ApiController
  before_action :set_driver_detail, only: [:show, :update, :destroy]
  before_action :authenticate_owner_user!, only: [:create, :update]

  def show
    render json: @driver_detail, root: false
  end

  def create
    # patente = Base64.decode64(params[:patente_data][:base64])
    patente = paperclip_object_from_base64(params[:patente_data][:base64], params[:patente_data][:filename], params[:patente_data][:filetype])
    # assicurazione = paperclip_object_from_base64(params[:assicurazione_data][:base64], params[:assicurazione_data][:filename], params[:assicurazione_data][:filetype])

    # driver_detail = DriverDetail.new(user_id: params[:user_id].to_i, patente: patente, assicurazione: assicurazione)
    driver_detail = DriverDetail.new(user_id: params[:user_id].to_i, patente: patente, license_type: params[:license_type], license_number: params[:license_number], license_release_date: params[:license_release_date], license_expire_date: params[:license_expire_date], license_release_city: params[:license_release_city], license_release_city_common: params[:license_release_city_common])

      if driver_detail.save
        set_user_pending_verification(driver_detail)
        render json: @user.pending_driver_verification, root: "driver_detail", status: 201
      else
        render :json => {:error => "Non è stato aggiornare i dati"}.to_json, :status => 500
      end
  end

  def destroy
    user = @driver_detail.user
    if @driver_detail.destroy
      user.cancel_pending_driver_verification
      render nothing: true, status: 200
    else
      render json: { error: "Non è stato possibile eliminare la richiesta." }
    end
  end

  def update
    if @driver_detail.update(driver_detail_params)
      render json: @driver_detail, serializer: RoomIdSerializer, root: "driver_detail", status: 201
    else
      render :json => {:error => "Non è stato possibile aggiornare la stanza"}.to_json, :status => 500
    end
  end

  private

  def set_user_pending_verification(driver_detail)
    @user = driver_detail.user
    @user.pending_driver_verification = true
    @user.save
  end

  def authenticate_owner_user!
    unless current_user
      render :json => {:error => "Owner user only."}.to_json, :status => 404
    end
  end

  def set_driver_detail
    @driver_detail = DriverDetail.find(params[:id])
  end

  def driver_detail_params
    params.require(:driver_detail).permit(:user_id, :patente, :assicurazione, :license_type, :license_number, :license_release_date, :license_expire_date, :license_release_city, :license_release_city_common)
  end
end
