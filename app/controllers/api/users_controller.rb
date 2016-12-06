class Api::UsersController < Api::ApiController

  before_action :set_user, only: [
    :show, :update, :pending_driver, :auth_pending_driver, :is_driver, :car_count,
    :pending_driver_verification, :set_profile_image, :sign_for_school, :profile, :update_device_tokens, :clear_device_tokens
  ]
  before_filter :authenticate_owner_user!, only: [:create, :update, :show, :is_driver, :car_count, :pending_driver_verification, :travels_count, :reviews_count, :set_profile_image]
  before_filter :authenticate_admin_user!, only: [:pending_drivers, :pending_driver_verification_count, :auth_pending_driver]

  skip_before_filter :authenticate_cors_user, only: [:sign_for_school, :profile]
  skip_before_filter :authenticate_user!, only: [:sign_for_school, :profile]

  api :GET, "/users/:id", "Get all user available data."
  def show
    render :json => @user, serializer: UserSerializer, root: false, status: 200
  end

  def update

  end

  def profile
    render json: @user, serializer: UserProfileSerializer, root: false, status: 200
  end

  def check_for_available_email
    if User.find_by( uid: params[:email] )
      render json: { available: false }, root: false, status: 200
    else
      render json: { available: true }, root: false, status: 200
    end
  end

  def preferred_rooms
    rooms = []
    current_user.preferred_rooms.each do |pr|
      if pr.room.is_active?
        rooms << pr.room
      end
    end
    render json: rooms, each_serializer: SlimRoomSerializer, root: false, status: 200
  end

  def update_device_tokens
    if @user.device_tokens.include?(params[:device_token])
      render json: { error: "Token already present" }, status: 513
    else
      @user.device_tokens << params[:device_token]
      @user.save
      render nothing: true, status: 200
    end
  end

  def clear_device_tokens
    if @user.device_tokens.empty?
      render json: { error: "No tokens to remove" }, status: 200
    else
      @user.device_tokens = []
      @user.save
      render nothing: true, status: 200
    end
  end

  api :GET, "/users/pending_driver_verification_count", "Return how many pending driver verifications there are."
  def pending_driver_verification_count
    count = User.needing_driver_verification.count
    render :json => count, root: false, status: 200
  end

  api :GET, "/users/pending_drivers", "Returns all the users who have a pending driver verification, in slim format."
  def pending_drivers
    users = User.needing_driver_verification
    render :json => users, each_serializer: SlimPendingDriverSerializer, root: false, status: 200
  end

  api :GET, "/users/pending_drivers/:id", "Returns a user with the given ID with all of its driver verification data."
  def pending_driver
    render :json => @user, serializer: PendingDriverSerializer, root: false, status: 200
  end

  api :POST, "/users/pending_drivers/auth/:id", "Confirm a user with pending driver verification as driver."
  def auth_pending_driver
    @user.is_driver = true
    @user.pending_driver_verification = false
    NotificationWorker.perform_async("became_authorized_driver", nil, @user.id)
    NotificationWorker.perform_async("add_a_car", nil, @user.id)
    if @user.save
      render nothing: true, status: 204
    else
      render :json => {:error => "Non è stato possibile effettuare l'operazione."}.to_json, :status => 500
    end
  end

  def set_profile_image
    @user.profile_image = paperclip_object_from_base64(params[:profile_image_data][:base64], params[:profile_image_data][:filename], params[:profile_image_data][:filetype])
    if @user.save
      render json: @user.profile_image.url.to_json, root: false, status: 200
    end
  end

  def create

  end

  def travels_count
    count = current_user.passenger_travels.count + current_user.travels_as_driver.completed.count
    render json: count, root: false, status:200
  end

  def reviews_count
    count = current_user.travel_reviews_as_target.count
    render json: count, root: false, status:200
  end

  def is_driver
    render :json => @user.is_driver, root: false, status: 200
  end

  def car_count
    render :json => @user.car_count, root: false, status: 200
  end

  def pending_driver_verification
    render :json => @user.pending_driver_verification, root: false, status: 200
  end

  def sign_for_school
    school_setting = SchoolRoomSetting.find_by code: params[:school_code]
    unless school_setting.nil?
      room = school_setting.room
      unless room.school_room_partecipants.any?{|srp| srp.user_id == params[:id]}
        SchoolRoomPartecipant.create! user_id: params[:id].to_i, room_id: room.id
        render nothing: true, status: 200
      else
        render nothing: true, status: 200
      end
    end
  end

  private

  def authenticate_owner_user!
    unless current_user.id == params[:id].to_i
      render :json => {:error => "Owner user only."}.to_json, :status => 403
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

end
