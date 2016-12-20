class Api::PrivateMessagesController < Api::ApiController
  before_action :authenticate_owner_user!

  def index
    private_messages = PrivateMessage.where(private_chat_id: params[:private_chat_id])
    render json: private_messages, root: false, status: 200
  end

  def create
    private_message = PrivateMessage.new(private_message_params)
    if private_message.save
      pc = PrivateChat.find(params[:private_chat_id])
      if pc.driver_id == current_user.id
        receiver_id = pc.passenger_id
        NotificationWorker.perform_async("received_a_private_message_as_passenger", current_user.id, receiver_id, options = {from_private_chat: true, from_driver: true, private_chat_id: pc.id})
      else
        receiver_id = pc.driver_id
        NotificationWorker.perform_async("received_a_private_message_as_driver", current_user.id, receiver_id, options = {from_private_chat: true, from_driver: false, private_chat_id: pc.id})
      end
      private_messages = PrivateMessage.where(private_chat_id: private_message.private_chat_id).order(created_at: :asc)
      render json: private_messages, root: false, status: 200
    else
      render :json => {:error => "Non è stato possibile salvare il messaggio."}.to_json, :status => 500
    end
  end

  private

  def authenticate_owner_user!
    pc = PrivateChat.find(params[:private_chat_id])
    unless pc.driver == current_user || pc.passenger == current_user
      render :json => {:error => "Owner user only."}.to_json, :status => 403
    end
  end

  def private_message_params
    params.require(:private_message).permit(:content, :author_id, :private_chat_id)
  end

end
