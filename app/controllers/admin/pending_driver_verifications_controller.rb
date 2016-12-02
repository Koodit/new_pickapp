class Admin::PendingDriverVerificationsController < AdminController
  before_action :set_pending_driver, except: [:index]

  def index
    @pending_drivers = User.needing_driver_verification
  end

  def show
    @driver_detail = @pending_driver.driver_detail
  end

  def become_driver
    @pending_driver.update is_driver: true, pending_driver_verification: false
    redirect_to admin_pending_driver_verifications_path, notice: "Aggiunto utente come driver con successo"
  end

  def deny_driver
    @pending_driver.update pending_driver_verification: false
    @pending_driver.driver_detail.destroy
    Notification.create(
      receiver_id: @pending_driver.id,
      title: "Conferma guidatore fallita!",
      body: "I dati forniti per diventare guidatore non sono stati accettati, per favore invia di nuovo."
    )
    redirect_to admin_pending_driver_verifications_path, notice: "Rifiutato utente come driver con successo"
  end

  private

  def set_pending_driver
    @pending_driver = User.find params[:id]
  end
end
