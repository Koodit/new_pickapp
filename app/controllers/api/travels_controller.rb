class Api::TravelsController < Api::ApiController
  before_action :set_travel, only: [:show, :mark_travel_as_completed, :destroy]
  before_action :set_travel_for_update, only: [:approve_user, :apply_user, :cancel_approval, :cancel_application]
  before_action :authenticate_owner_user!, only: [:travels_for_user_as_driver]
  before_action :authenticate_user_travel_member!, only: [:show_travel_for_user]

  def destroy
    if current_user.id == @travel.driver_id
      if @travel.destroy
        render nothing: true, status: 200
      else
        render json: {error: "Non è stato possibile cancellare l'offerta."}, root: false, status: 513
      end
    else
      render json: {error: "Verifica di essere il proprietario dell'offerta' e riprova."}, root: false, status: 513
    end
  end

  def create
    travel = Travel.new towards_room: params[:towards_room], driver_id: params[:driver_id], room_id: params[:room_id], car_id: params[:car_id], departure_datetime: params[:departure_datetime], flexible_departure: params[:flexible_departure], can_repay: params[:can_repay], only_with_feedback: params[:only_with_feedback]
    if travel.towards_room
      travel.starting_address = params[:user_address]
    else
      travel.destination_address = params[:user_address]
    end
    if params[:is_recursive]
      travel.is_recursive = true
    end
    unless params[:travel_stops].nil?
      params[:travel_stops].each do |travel_stop|
        travel.travel_stops.new(address: travel_stop["address"])
      end
    end
    if travel.save
      travel.public_chat_partecipants.create user_id:current_user.id, travel_id:travel.id
      if params[:backwards_too]
        travel_backwards = Travel.new towards_room: !params[:towards_room], driver_id: params[:driver_id], room_id: params[:room_id], car_id: params[:car_id], departure_datetime: params[:back_departure_datetime], flexible_departure: params[:flexible_departure], can_repay: params[:can_repay], only_with_feedback: params[:only_with_feedback]
        travel_backwards.starting_address = travel.destination_address
        travel_backwards.destination_address = travel.starting_address
        if params[:is_recursive]
          travel_backwards.is_recursive = true
        end
        if travel_backwards.save
          travel_backwards.public_chat_partecipants.create user_id:current_user.id, travel_id:travel.id
        end
      end
      if params[:is_recursive]
        create_recursives_for(travel)
      end
      render nothing:true, status: 201
    else
      if travel.errors.any?
        travel.errors.full_messages.each do |msg|
          puts msg
        end
      end
      render :json => {:error => "Non è stato possibile creare il viaggio."}.to_json, :status => 500
    end
  end

  def index
    travels = Travel.where(room_id: params[:room_id]).available_now
    render json: travels, each_serializer:SlimTravelSerializer, root: false, status: 200
  end

  def next_24_hours
    travels = Travel.where(room_id: params[:room_id]).next_24_hours
    render json: travels, each_serializer:SlimTravelSerializer, root: false, status: 200
  end

  def show
    if @travel.driver == current_user
      render json: @travel, serializer: DriverTravelSerializer, root:false, status:200
    else
      render json: @travel, serializer: TravelSerializer, root:false, status:200
    end
  end

  def approve_user
    @travel.approved_users.create user_id:params[:user_id], travel_id:@travel.id
    applied = AppliedUser.where(user_id:params[:user_id]).where(travel_id:@travel.id).first
    unless applied.nil?
      applied.destroy
    end
    @travel.save
    NotificationWorker.perform_async("user_approved_by_driver", current_user.id, params[:user_id], options = {user_approved_by_driver: true, travel_id: @travel.id})

    ns = NotificationService.new
    room = @travel.room

    title = ns.title_for_user_approved_by_driver(current_user.name, current_user.surname)
    body = ns.body_for_user_approved_by_driver(current_user.name, current_user.surname, @travel.towards_room ? "verso" : "da", room.name)
    link = "<a href='http://www.pick-app.it"+ns.link_for_user_approved_by_driver(room.id, @travel.id)+"'>Link</a>"
    applying = User.find(params[:user_id])
    PickAppMailer.send_email(applying.email, title, body, link, applying.device_tokens).deliver_later

    render json: @travel, serializer: DriverTravelSerializer, root:false, status:200
  end

  def cancel_approval
    @travel.applied_users.create user_id:params[:user_id], travel_id:@travel.id
    approved = ApprovedUser.where(user_id:params[:user_id]).where(travel_id:@travel.id).first
    unless approved.nil?
      approved.destroy
    end
    @travel.save
    render json: @travel, serializer: DriverTravelSerializer, root:false, status:200
  end

  def apply_user
    @travel.applied_users.create user_id: current_user.id, travel_id: @travel.id
    @travel.save
    NotificationWorker.perform_async("user_applied_to_travel", current_user.id, @travel.driver.id, options = {user_applied_to_travel: true, travel_id: @travel.id})

    ns = NotificationService.new
    title = ns.title_for_user_applied_to_travel
    body = ns.body_for_user_applied_to_travel(current_user.name, current_user.surname, @travel.towards_room ? "verso" : "da", @room.name)
    link = "<a href='http://www.pick-app.it"+room_travel_path(@travel.room, @travel)+"'>Link</a>"
    PickAppMailer.send_email(@travel.driver.email, title, body, link, @travel.driver.device_tokens).deliver_later

    render json: @travel, serializer:TravelSerializer, root: false, status: 200
  end

  def cancel_application
    applied = AppliedUser.where(user_id:params[:user_id]).where(travel_id:@travel.id).first
    unless applied.nil?
      notification_id = applied.notification_id
      applied.destroy
      notification = Notification.where(id: notification_id).first
      unless notification.nil?
        notification.destroy
      end
    end
    is_applied = false
    render json: is_applied.to_json, root: false, status: 200
  end

  def travels_for_user_as_driver
    travels = current_user.travels_as_driver
    render json: travels, each_serializer: SlimUserTravelSerializer, root: false, status: 200
  end

  def travels_for_user_as_applied
    applied_users = current_user.applied_users
    travels = []
    applied_users.each do |au|
      travels << au.travel
    end
    render json: travels, each_serializer: SlimUserTravelSerializer, root: false, status: 200
  end

  def travels_for_user_as_approved
    approved_users = current_user.approved_users
    travels = []
    approved_users.each do |au|
      travels << au.travel
    end
    unless travels.any?
      puts travels
    else
      render json: travels, each_serializer: SlimUserTravelSerializer, root: false, status: 200
    end
  end

  def travels_for_user_as_passenger
    passenger_travels = current_user.passenger_travels
    travels = []
    passenger_travels.each do |au|
      travels << au.travel
    end
    render json: travels, each_serializer: SlimUserTravelSerializer, root: false, status: 200
  end

  def show_travel_for_user
    if @travel.driver == current_user
      render json: @travel, serializer: UserDriverTravelSerializer, root: false, status: 200
    else
      render json: @travel, serializer: UserTravelSerializer, root: false, status: 200
    end
  end

  def mark_travel_as_completed
    @travel.waiting_for_confirm = false
    @travel.completed = true
    if @travel.save
      @travel.approved_users.each do |approved_user|
        @travel.passenger_travels.create user_id: approved_user.user_id, travel_id: @travel.id
        review_for_passenger = TravelReview.new  user_id: current_user.id, target_id: approved_user.user_id, travel_id: @travel.id, made_by_driver: true, to_be_written: true
        review_for_passenger.save
        review_for_driver = TravelReview.new  user_id: approved_user.user_id, target_id: current_user.id, travel_id: @travel.id, made_by_driver: false, to_be_written: true
        review_for_driver.save
        BadgeWorker.perform_async(approved_user.user_id, "CitizenBadge")
        BadgeWorker.perform_async(nil, "SocialMasterBadge", options = {driver_id: current_user.id, passenger_id: approved_user.user_id})
        NotificationWorker.perform_async("travel_confirmed_for_passenger", @travel.driver_id, approved_user.user_id, options = {travel_expired_for_driver: true, is_passenger: true, travel_id: @travel.id})
        approved_user.destroy
      end
      render json: @travel, serializer: UserDriverTravelSerializer, root: false, status: 200
    end
  end

  private

  def create_recursives_for(travel)
    if params[:repetions_amount]
      repetitions_count = params[:repetions_amount].to_i
    else
      repetitions_count = travel.repetions_amount.to_i
    end

    for i in 1..(repetitions_count-1)
      recursive_date = Time.parse(params[:departure_datetime]) + (i * 7).days
      travel = Travel.new(
        towards_room: travel.towards_room, 
        driver_id: travel.driver_id, 
        room_id: travel.room_id, 
        car_id: travel.car_id, 
        departure_datetime: recursive_date, 
        is_recursive: false,
        backwards_too: travel.backwards_too,
        flexible_departure: travel.flexible_departure,
        can_repay: travel.can_repay,
        only_with_feedback: travel.only_with_feedback,
        starting_address: travel.starting_address,
        destination_address: travel.destination_address,
        repetions_amount: 0
      )

      # if travel.towards_room
      #   travel.starting_address = params[:user_address]
      # else
      #   travel.destination_address = params[:user_address]
      # end

      unless params[:travel_stops].nil?
        params[:travel_stops].each do |travel_stop|
          travel.travel_stops.new(address: travel_stop["address"])
        end
      end
      if travel.save
        travel.public_chat_partecipants.create user_id: current_user.id, travel_id: travel.id
        if params[:backwards_too]
          recursive_back_date = Time.parse(params[:back_departure_datetime]) + (i * 7).days
          travel_backwards = Travel.new(
            towards_room: !params[:towards_room], 
            driver_id: params[:driver_id], 
            room_id: params[:room_id], 
            car_id: params[:car_id], 
            departure_datetime: recursive_back_date, 
            is_recursive: false,
          )
          travel_backwards.starting_address = travel.destination_address
          travel_backwards.destination_address = travel.starting_address
          if travel_backwards.save
            travel_backwards.public_chat_partecipants.create user_id:current_user.id, travel_id:travel.id
          end
        end
      end
    end
  end

  def set_travel
    @travel = Travel.find(params[:id])
  end

  def set_travel_for_update
    @travel = Travel.find(params[:travel_id])
  end

  def authenticate_owner_user!
    unless current_user
      render :json => {:error => "Owner user only."}.to_json, :status => 403
    end
  end

  def authenticate_user_travel_member!
    @travel = Travel.find(params[:id])
    unless @travel.passenger_travels.any?{|pt| pt.user_id == current_user.id} || @travel.applied_users.any?{|au| au.user_id == current_user.id} || @travel.approved_users.any?{|au| au.user_id == current_user.id} || @travel.driver_id == current_user.id
      render :json => {:error => "Authorized users only."}.to_json, :status => 403
    else
      if @travel.applied_users.any?{|au| au.user_id == current_user.id}
        if @travel.waiting_for_confirm
          render :json => {:error => "Authorized users only."}.to_json, :status => 403
        end
      end
    end
  end

  def travel_params
    params.require(:travel).permit(:starting_address, :departure_datetime, :towards_room, :destination_address, :car_id, :driver_id, :room_id, :flexible_departure, :only_with_feedback, :repetions_amount, :repetitions_amount, :can_repay)
  end

end
