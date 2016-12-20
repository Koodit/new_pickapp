class Api::TravelRequestMessagesController < Api::ApiController
  def create
    travel_request_message = TravelRequestMessage.new(travel_request_message_params)
    if travel_request_message.save
      travel_request = travel_request_message.travel_request
      unless travel_request.travel_request_chat_partecipants.any?{|pcp| pcp.user_id == current_user.id}
        travel_request.travel_request_chat_partecipants.create user_id:current_user.id, travel_request_id:travel_request.id
      end
      unless travel_request.travel_request_chat_partecipants.count == 0
        # puts travel.public_chat_partecipants.to_a.first.user.name
        NotificationWorker.perform_async("received_a_travel_request_message", current_user.id, Array.new, options = {from_travel_request_chat: true, owner_id:travel_request.passenger.id, travel_request_id: travel_request.id})
      end
      travel_request_messages = TravelRequestMessage.where(travel_request_id: params[:travel_request_id]).order(created_at: :desc)
      render json: travel_request_messages, root: false, status: 200
    else
      render :json => {:error => "Non è stato possibile salvare il messaggio."}.to_json, :status => 500
    end
  end

  def index
    travel_request_messages = TravelRequestMessage.where(travel_request_id: params[:travel_request_id]).order(created_at: :desc)
    render json: travel_request_messages, root: false, status: 200
  end

  private

  def travel_request_message_params
    params.require(:travel_request_message).permit(:content, :author_id, :travel_request_id, :is_request_owner)
  end
end
