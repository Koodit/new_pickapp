class TravelsController < ApplicationController
  def show
    @travel = Travel.includes(:public_messages).find_by(id: params[:room_id])
    @public_message = PublicMessage.new
  end

  def new
    @travel_offer = Travel.new
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

        if travel_backwards.save
          travel_backwards.public_chat_partecipants.create user_id: current_user.id, travel_id: @travel_offer.id
        end
      end

      # if @travel_offer.is_recursive
      #   create_recursives_for(@travel_offer)
      # end

      redirect_to room_path(@room), notice: "Offerta di passaggio creata con successo"
    else
      render :new
    end
  end

  private

  def travel_params
    params.require(:travel).permit(
      :starting_address, :car_id, :driver_id, :room_id,
      :completion_token, :completed, :waiting_for_confirm,
      :departure_datetime, :towards_room, :starting_lat, :starting_lng,
      :destination_address, :destination_lat, :destination_lng,
      :desired_address, :city, :zip_code, :is_recursive, :back_departure_datetime,
      :flexible_departure, :only_with_feedback, :can_repay, :backwards_too,
      travel_stops_attributes: [:id, :desired_address, :city, :zip_code, :_destroy]
    )
  end

  # def create_recursives_for(travel)
  #   if params[:repetitions_amount]
  #     repetitions_count = params[:repetitions_amount]
  #   else
  #     repetitions_count = params[:repetions_amount]
  #   end

  #   for i in 1..(repetitions_count-1)
  #     recursive_date = Time.parse(params[:departure_datetime]) + (i * 7).days
  #     travel = Travel.new towards_room: params[:towards_room], driver_id: params[:driver_id], room_id: params[:room_id], car_id: params[:car_id], departure_datetime: recursive_date, is_recursive: true
  #     if travel.towards_room
  #       travel.starting_address = params[:user_address]
  #       travel.destination_address = travel.room.address
  #     else
  #       travel.starting_address = travel.room.address
  #       travel.destination_address = params[:user_address]
  #     end
  #     unless params[:travel_stops].nil?
  #       params[:travel_stops].each do |travel_stop|
  #         travel.travel_stops.new(address: travel_stop["address"])
  #       end
  #     end
  #     if travel.save
  #       travel.public_chat_partecipants.create user_id:current_user.id, travel_id:travel.id
  #       if params[:backwards_too]
  #         recursive_back_date = Time.parse(params[:back_departure_datetime]) + (i * 7).days
  #         travel_backwards = Travel.new towards_room: !params[:towards_room], driver_id: params[:driver_id], room_id: params[:room_id], car_id: params[:car_id], departure_datetime: recursive_back_date, is_recursive: true
  #         travel_backwards.starting_address = travel.destination_address
  #         travel_backwards.destination_address = travel.starting_address
  #         if travel_backwards.save
  #           travel_backwards.public_chat_partecipants.create user_id:current_user.id, travel_id:travel.id
  #         end
  #       end
  #     end
  #   end
  # end
end
