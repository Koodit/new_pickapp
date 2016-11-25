class TravelRequestsController < ApplicationController
  def new
    @travel_request = TravelRequest.new
    @room = Room.find(params[:room_id])
  end

  def create
    @room = Room.find(params[:room_id])
    @travel_request = TravelRequest.new travel_request_params
    @travel_request.passenger_id = current_user.id
    @travel_request.room_id = @room.id

    if @travel_request.save
      redirect_to room_path(@travel_request.room), notice: "Richiesta passaggio creata con successo"
    else
      render :new
    end
  end

  private

  def travel_request_params
    params.require(:travel_request).permit(
      :passenger_id, :room_id, :starting_address, :lat, :lng,
      :is_one_way, :one_way_datetime, :back_datetime, :towards_room,
      :can_repay, :destination_address, :note, :flexible_departure, :only_with_feedback,
      :desired_address, :city, :zip_code
    )
  end
end