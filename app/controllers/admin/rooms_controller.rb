class Admin::RoomsController < AdminController
  before_action :set_room, except: [:index, :new, :create]

  def index
    @rooms = Room.all
  end

  def show
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new room_params
    if @room.save
      redirect_to admin_rooms_path, notice: "Stanza creata con successo"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @room.update room_params
      redirect_to admin_rooms_path, notice: "Stanza aggiornata con successo"
    else
      render :edit
    end
  end

  def destroy
    if @room
      @room.destroy
      redirect_to admin_rooms_path, notice: "Stanza eliminata con successo"
    end
  end

  private

  def set_room
    @room = Room.find params[:id]
  end

  def room_params
    params.require(:room).permit(
      :admin_editable, :name, :rating, :total_rating, :number_of_ratings, :price,
      :start_date, :end_date, :is_private, :website, :facebook, :twitter, :instagram,
      :trip_advisor, :phone, :address, :lat, :long, :room_category_id, :background_image,
      :description, :is_school, room_images_attributes: [:id, :image],
      room_school_setting_attributes: [:id, :school_representative, :non_partecipant_message, :referral_link, :share_link, :code, :email_domain]
    )
  end
end
