class PrivateChatsChannel < ApplicationCable::Channel  
  def subscribed
    stream_from "private_chat_#{params['private_chat_id']}_messages"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)

    private_chat = PrivateChat.find(data['private_chat_id'])

    private_message = PrivateMessage.create!(
      content: data['content'],
      private_chat_id: data['private_chat_id'],
      author_id: current_user.id
    )

    if private_message.save
      pc = PrivateChat.find(params[:private_chat_id])
      # if pc.driver_id == current_user.id
      #   receiver_id = pc.passenger_id
      #   NotificationWorker.perform_async("received_a_private_message_as_passenger", current_user.id, receiver_id, options = {from_private_chat: true, from_driver: true, private_chat_id: pc.id})
      # else
      #   receiver_id = pc.driver_id
      #   NotificationWorker.perform_async("received_a_private_message_as_driver", current_user.id, receiver_id, options = {from_private_chat: true, from_driver: false, private_chat_id: pc.id})
      # end
      PrivateMessageBroadcastJob.perform(private_message, current_user.id)
    end
  end

end  