class Api::TravelRequestsController < Api::ApiController
  before_action :set_travel_request, only: [:show, :destroy]

  def create
    travel_request = TravelRequest.new(travel_request_params)
    # if travel_request.towards_room
    #   travel_request.destination_address = travel_request.room.address
    # else
    #   travel_request.destination_address = travel_request.starting_address
    #   travel_request.starting_address = travel_request.room.address
    # end
    if travel_request.save
      travel_request.travel_request_chat_partecipants.create user_id: current_user.id, travel_request_id: travel_request.id
      render nothing: true, status: 201
    else
      render :json => {:error => "Non è stato possibile creare la richiesta."}.to_json, :status => 500
    end
  end

  def destroy
    if current_user.id == @travel_request.passenger_id
      if @travel_request.destroy
        render nothing: true, status: 200
      else
        render json: {error: "Non è stato possibile cancellare la richiesta."}, root: false, status: 513
      end
    else
      render json: {error: "Verifica di essere il proprietario della richiesta e riprova."}, root: false, status: 513
    end
  end

  def index
    travel_requests = TravelRequest.where(room_id: params[:room_id]).available_now
    render json: travel_requests, each_serializer:SlimTravelRequestSerializer, root: false, status: 200
  end

  def next_24_hours
    travel_requests = TravelRequest.where(room_id: params[:room_id]).next_24_hours
    render json: travel_requests, each_serializer:SlimTravelRequestSerializer, root: false, status: 200
  end

  def show
    render json: @travel_request, serializer: TravelRequestSerializer, root:false, status:200
  end

  private

  def set_travel_request
    @travel_request = TravelRequest.find(params[:id])
  end

  def authenticate_owner_user!
    unless current_user
      render :json => {:error => "Owner user only."}.to_json, :status => 403
    end
  end

  def travel_request_params
    params.require(:travel_request).permit(:back_datetime, :is_one_way, :one_way_datetime,
      :starting_address, :desired_address, :city, :zip_code, :passenger_id, :room_id, :towards_room, :can_repay, :note, :only_with_feedback, :flexible_departure)
  end
end
