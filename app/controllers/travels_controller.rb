class TravelsController < ApplicationController
  before_action :set_travel, except: [:new, :create]
  before_action :check_if_driver, only: [:new, :create]
  before_action :check_if_has_a_car, only: [:new, :create]

  def show
    @public_message = PublicMessage.new
  end

  def new
    @travel_offer = Travel.new
    @room = Room.find(params[:room_id])
  end

  def create
    @room = Room.find params[:room_id]
    @travel_offer = Travel.new travel_params
    @travel_offer.driver_id = current_user.id
    @travel_offer.room_id = @room.id
    if @travel_offer.save
      @travel_offer.public_chat_partecipants.create user_id: current_user.id, travel_id: @travel_offer.id

      if @travel_offer.backwards_too == "1"
        travel_backwards = Travel.new(
          towards_room: !@travel_offer.towards_room,
          driver_id: @travel_offer.driver_id,
          room_id: @travel_offer.room_id,
          car_id: @travel_offer.car_id,
          departure_datetime: @travel_offer.back_departure_datetime,
          flexible_departure: @travel_offer.flexible_departure,
          can_repay: @travel_offer.can_repay,
          only_with_feedback: @travel_offer.only_with_feedback,
          is_recursive: @travel_offer.is_recursive,
          desired_address: @travel_offer.desired_address,
          city: @travel_offer.city,
          zip_code: @travel_offer.zip_code
        )

        if @travel_offer.travel_stops.any?
          @travel_offer.travel_stops.each do |travel_stop|
            travel_backwards.travel_stops.new(
              desired_address: travel_stop.desired_address,
              city: travel_stop.city,
              zip_code: travel_stop.zip_code
            )
          end
        end

        if travel_backwards.save
          travel_backwards.public_chat_partecipants.create user_id: current_user.id, travel_id: @travel_offer.id
        end
      end

      if @travel_offer.is_recursive == true
        create_recursives_for(@travel_offer)
      end

      redirect_to room_path(@room), notice: "Offerta di passaggio creata con successo"
    else
      js "#new"
      render :new
    end
  end

  def destroy
    room = Room.find params[:room_id]
    if current_user.id == @travel_offer.driver_id
      if @travel_offer
        @travel_offer.destroy
        redirect_to room_path(room)
      end
    else
      render json: {error: "Verifica di essere il proprietario dell'offerta' e riprova."}, root: false, status: 513
    end
  end

  def apply_user
    @travel_offer.applied_users.create user_id: current_user.id
    NotificationWorker.perform_async("user_applied_to_travel", current_user.id, @travel_offer.driver_id, options = { user_applied_to_travel: true, travel_id: @travel_offer.id })
    redirect_to room_travel_path(@travel_offer.room, @travel_offer)
  end

  def cancel_application
    applied = @travel_offer.applied_users.where(user_id: current_user.id).first
    applied.destroy
    notification_id = applied.notification_id
    notification = Notification.find notification_id
    unless notification.nil?
      notification.destroy
    end
    redirect_to room_travel_path(@travel_offer.room, @travel_offer)
  end

  def approve_user
    applied = @travel_offer.applied_users.where(user_id: params[:user_id]).first
    applied.destroy
    approved = @travel_offer.approved_users.create user_id: params[:user_id]
    NotificationWorker.perform_async("user_approved_by_driver", current_user.id, params[:user_id], options = { user_approved_by_driver: true, travel_id: @travel_offer.id })
    redirect_to room_travel_path(@travel_offer.room, @travel_offer)
  end

  def cancel_approval
    @travel_offer.applied_users.create user_id: params[:user_id]
    approved = @travel_offer.approved_users.where(user_id: params[:user_id]).first
    approved.destroy
    redirect_to room_travel_path(@travel_offer.room, @travel_offer)
  end

  def mark_travel_as_completed
    @travel_offer.waiting_for_confirm = false
    @travel_offer.completed = true
    if @travel_offer.save
      @travel_offer.approved_users.each do |approved_user|
        @travel_offer.passenger_travels.create user_id: approved_user.user_id
        review_for_passenger = @travel_offer.travel_reviews.create  user_id: @travel_offer.driver_id, target_id: approved_user.user_id, room_id: @travel_offer.room.id, made_by_driver: true, to_be_written: true
        review_for_passenger.save
        review_for_driver = @travel_offer.travel_reviews.create  user_id: approved_user.user_id, target_id: @travel_offer.driver_id, room_id: @travel_offer.room.id, made_by_driver: false, to_be_written: true
        review_for_driver.save
        # BadgeWorker.perform_async(approved_user.user_id, "CitizenBadge")
        # BadgeWorker.perform_async(nil, "SocialMasterBadge", options = {driver_id: current_user.id, passenger_id: approved_user.user_id})
        # NotificationWorker.perform_async("travel_confirmed_for_passenger", @travel_offer.driver_id, approved_user.user_id, options = { travel_expired_for_driver: true, is_passenger: true, travel_id: @travel_offer.id })
        approved_user.destroy
      end
      redirect_to room_travel_path(@travel_offer.room, @travel_offer)
    end
  end

  private

  def set_travel
    @travel_offer = Travel.includes(:public_messages).find params[:id]
  end

  def travel_params
    params.require(:travel).permit(
      :starting_address, :car_id, :driver_id, :room_id,
      :completion_token, :completed, :waiting_for_confirm,
      :departure_datetime, :towards_room, :starting_lat, :starting_lng,
      :destination_address, :destination_lat, :destination_lng, :repetions_amount,
      :desired_address, :city, :zip_code, :is_recursive, :back_departure_datetime,
      :flexible_departure, :only_with_feedback, :can_repay, :backwards_too,
      travel_stops_attributes: [:id, :desired_address, :city, :zip_code, :_destroy]
    )
  end

  def create_recursives_for(travel_offer)
    if params[:repetitions_amount]
      repetitions_count = params[:repetitions_amount]
    else
      repetitions_count = travel_offer.repetions_amount.to_i
    end

    for i in 1..(repetitions_count - 1)
      recursive_date = travel_offer.departure_datetime + (i * 7).days
      travel = Travel.new(
        towards_room: travel_offer.towards_room,
        driver_id: travel_offer.driver_id,
        room_id: travel_offer.room_id,
        car_id: travel_offer.car_id,
        departure_datetime: recursive_date,
        is_recursive: true,
        backwards_too: travel_offer.backwards_too,
        flexible_departure: @travel_offer.flexible_departure,
        can_repay: @travel_offer.can_repay,
        only_with_feedback: @travel_offer.only_with_feedback,
        desired_address: travel_offer.desired_address,
        city: travel_offer.city,
        zip_code: travel_offer.zip_code
      )

      if travel_offer.travel_stops.any?
        travel_offer.travel_stops.each do |travel_stop|
          travel.travel_stops.new(
            desired_address: travel_stop.desired_address,
            city: travel_stop.city,
            zip_code: travel_stop.zip_code
          )
        end
      end

      if travel.save
        travel.public_chat_partecipants.create user_id: current_user.id, travel_id: travel.id

        if travel.backwards_too == "1"
          recursive_back_date = Time.zone.parse(travel_offer.back_departure_datetime).to_datetime + (i * 7).days
          travel_backwards = Travel.new(
            towards_room: !travel.towards_room,
            driver_id: travel.driver_id,
            room_id: travel.room_id,
            car_id: travel.car_id,
            departure_datetime: recursive_back_date,
            is_recursive: true,
            flexible_departure: @travel_offer.flexible_departure,
            can_repay: @travel_offer.can_repay,
            only_with_feedback: @travel_offer.only_with_feedback,
            desired_address: travel.desired_address,
            city: travel.city,
            zip_code: travel.zip_code
          )

          if travel.travel_stops.any?
            travel.travel_stops.each do |travel_stop|
              travel_backwards.travel_stops.new(
                desired_address: travel_stop.desired_address,
                city: travel_stop.city,
                zip_code: travel_stop.zip_code
              )
            end
          end

          if travel_backwards.save
            travel_backwards.public_chat_partecipants.create user_id: current_user.id, travel_id: travel.id
          end

        end
      end
    end
  end

  def check_if_driver
    @room = Room.find params[:room_id]
    unless current_user.is_driver
      redirect_to room_path(@room)
    end
  end

  def check_if_has_a_car
    if current_user.cars.empty?
      redirect_to new_car_path, notice: "Inserisci un'auto per poter offrire passaggi"
    end
  end

end
