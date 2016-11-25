class TravelsController < ApplicationController
  before_action :set_travel, only: [:show, :destroy]

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
      render :new
    end
  end

  def destroy
    room = Room.find params[:room_id]
    if current_user.id == @travel.driver_id
      if @travel_offer
        @travel_offer.destroy
        redirect_to room_path(room)
      end
    else
      render json: {error: "Verifica di essere il proprietario dell'offerta' e riprova."}, root: false, status: 513
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

end
