class Api::RoomsController < Api::ApiController
  before_action :set_room, only: [:show, :edit, :update]
  before_filter :authenticate_admin_user!, only: [:create, :update]

  def index
    @rooms = Room.all
    render :json => @rooms, each_serializer: SlimRoomSerializer, root: false, status: 200
  end

  def search_rooms
    # @rooms = Room.search(params[:q])
    @rooms = Room.advanced_search(params[:q].to_s)
    render json: @rooms, each_serializer: SlimRoomSerializer, root: false, status: 200
  end

  def show
    if @room.is_school
      if @room.school_room_partecipants.any?{|srp| srp.user_id == current_user.id} || current_user.role == "administrator"
        if current_user.role == "administrator"
          render :json => @room, serializer: SchoolRoomSerializer, root: false
        else
          render :json => @room, root: false
        end
      else
        render :json => @room, serializer: RestrictSchoolRoomSerializer, root: false
      end
    else
      render :json => @room, serializer: RoomSerializer, root: false
    end
  end

  def new
    @room = Room.new
    2.times { @room.room_images.build }
  end

  def search
    @room = Room.find(params[:room_id])
    travels = @room.travels.includes(:car, :driver).available_now.where(towards_room: params[:towards_room])

    if !params[:min_departure_datetime].nil?
      travels = travels.where("departure_datetime > ?", params[:min_departure_datetime])
    end

    if !params[:max_departure_datetime].nil?
      travels = travels.where("departure_datetime < ?", params[:max_departure_datetime])
    end

    if params[:can_smoke]
      travels = travels.where(:cars => {can_smoke: params[:can_smoke]})
    end

    if params[:animals_allowed]
      travels = travels.where(:cars => {animals_allowed: params[:animals_allowed]})
    end

    if params[:is_recursive]
      travels = travels.recursive
    end

    if params[:only_with_review]
      travels_temp = []
      travels.each do |travel|
        if travel.driver.travel_reviews_as_target.where(made_by_driver: false).count > 0
          travels_temp << travel
        end
      end
      travels = travels_temp
      travels_temp = nil
    end

    render json: travels, each_serializer: SlimTravelSerializer, root: false, status: 200
  end

  def latest_room
    room = Room.active.order(created_at: :desc).limit(1).first
    render json: room, serializer: SlimRoomSerializer, root: false, status: 200
  end

  def set_favourite
    room = Room.find(params[:room_id])
    unless room.preferred_rooms.any?{|pr| pr.user_id == current_user.id}
      preferred_room = PreferredRoom.new user_id:current_user.id, room_id: room.id
      if preferred_room.save
        render json: true, root: false, status: 201
      else
        render :json => {:error => "Si è verificato un errore"}.to_json, :status => 500
      end
    end
  end

  def unset_favourite
    room = Room.find(params[:room_id])
    if room.preferred_rooms.any?{|pr| pr.user_id == current_user.id}
      preferred_room = PreferredRoom.where(user_id: current_user.id).first
      if preferred_room.destroy
        render json: false, root: false, status: 201
      else
        render :json => {:error => "Si è verificato un errore"}.to_json, :status => 500
      end
    end
  end

  def create
    puts params.except!(:background_image).inspect
    room = Room.new(room_params)

    unless params[:background_image].nil?
      bg_image = paperclip_object_from_base64(params[:background_image][:base64], params[:background_image][:filename], params[:background_image][:filetype])
      room.background_image = bg_image
    end

    if room.save
      ######### SCHOOL ROOM #########
      if params[:is_school]
        SchoolRoomSetting.create! email_domain: params[:email_domain], school_representative: params[:school_representative], non_partecipant_message: params[:non_partecipant_message], referral_link: params[:referral_link], room_id: room.id
      end
      ######### END SCHOOL ROOM #########
      render json: room, serializer:RoomIdSerializer, root: "room", status: 201
    else
      render :json => {:error => "Non è stato possibile creare la stanza"}.to_json, :status => 500
    end
  end

  def update
    if @room.update(room_params)
      unless params[:background_image].nil?
        bg_image = paperclip_object_from_base64(params[:background_image][:base64], params[:background_image][:filename], params[:background_image][:filetype])
        @room.background_image = bg_image
      end

      ### Doggy modifica scuola
      if params[:is_school]
        @room.school_room_setting.update email_domain: params[:email_domain], school_representative: params[:school_representative], non_partecipant_message: params[:non_partecipant_message], referral_link: params[:referral_link]
      end

      @room.save

      render json: @room, serializer:RoomIdSerializer, root: "room", status: 201
    else
      render :json => {:error => "Non è stato possibile aggiornare la stanza"}.to_json, :status => 500
    end
  end

  private

  def set_room
    @room = Room.includes(:private_room_setting).find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, :address, :lat, :long, :admin_editable,
     :start_date, :end_date, :facebook, :instagram, :is_private,
     :phone, :price, :total_rating, :number_of_ratings, :description, :is_school,
     :rating, :trip_advisor, :twitter, :website, :room_category_id,
     room_images_attributes: [:image])
  end
end
