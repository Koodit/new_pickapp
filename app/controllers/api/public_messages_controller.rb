class Api::PublicMessagesController < Api::ApiController
  def create
    public_message = PublicMessage.new(public_message_params)
      if public_message.save
        travel = public_message.travel
        unless travel.public_chat_partecipants.any?{|pcp| pcp.user_id == current_user.id}
          travel.public_chat_partecipants.create user_id:current_user.id, travel_id:travel.id
        end
        unless travel.public_chat_partecipants.count == 0
          # puts travel.public_chat_partecipants.to_a.first.user.name
          NotificationWorker.perform_async("received_a_public_message", current_user.id, Array.new, options = {from_public_chat: true, owner_id:travel.driver.id, travel_id: travel.id})
        end
        public_messages = PublicMessage.where(travel_id: public_message.travel_id).order(created_at: :asc)
        render json: public_messages, root: false, status: 200
      else
        render :json => {:error => "Non è stato possibile salvare il messaggio."}.to_json, :status => 500
      end
  end

  def index
    public_messages = PublicMessage.where(travel_id: params[:travel_id]).order(created_at: :asc)
    render json: public_messages, root: false, status: 200
  end

  private
  def public_message_params
    params.require(:public_message).permit(:content, :author_id, :travel_id, :is_travel_owner)
  end
end
