class TravelRequestsController < ApplicationController
  before_action :set_travel_request, only: [:show, :destroy]

  def show  
  end

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
      js "#new"
      render :new
    end
  end

  def destroy
    @room = Room.find params[:room_id]
    if @travel_request
      if current_user.id == @travel_request.passenger_id
        @travel_request.destroy
        redirect_to room_path(@room)
      end
    end
  end

  private

  def set_travel_request
    @travel_request = TravelRequest.find params[:id]
  end

  def travel_request_params
    params.require(:travel_request).permit(
      :passenger_id, :room_id, :starting_address, :lat, :lng,
      :is_one_way, :one_way_datetime, :back_datetime, :towards_room,
      :can_repay, :destination_address, :note, :flexible_departure, :only_with_feedback,
      :desired_address, :city, :zip_code
    )
  end
end