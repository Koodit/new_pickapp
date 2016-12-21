class TravelRequestsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "travel_request_#{params['travel_request_id']}_public_messages"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)

    travel_request = TravelRequest.find(data['travel_request_id'])

    travel_request_message = TravelRequestMessage.create!(
      content: data['content'],
      travel_request_id: data['travel_id'],
      author_id: current_user.id,
      is_request_owner: (travel_request.passenger_id == current_user.id)
    )

    if travel_request_message.save
      travel_request = travel_request_message.travel_request
      unless travel_request.travel_request_chat_partecipants.any?{|pcp| pcp.user_id == current_user.id}
        travel_request.travel_request_chat_partecipants.create user_id:current_user.id, travel_request_id:travel_request.id
      end
      unless travel_request.travel_request_chat_partecipants.count == 0
        # puts travel.public_chat_partecipants.to_a.first.user.name
        # NotificationWorker.perform_async("received_a_public_message", current_user.id, Array.new, options = {from_public_chat: true, owner_id:travel.driver.id, travel_id: travel.id})
        TravelRequestMessageBroadcastJob.perform_later(travel_request_message, current_user.id)
      end
    end
  end

end
