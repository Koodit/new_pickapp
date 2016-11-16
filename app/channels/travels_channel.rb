class TravelsChannel < ApplicationCable::Channel  
  def subscribed
    stream_from "travel_#{params['travel_id']}_public_messages"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)

    travel = Travel.find(data['travel_id'])

    public_message = PublicMessage.create!(
      content: data['content'],
      travel_id: data['travel_id'],
      author_id: current_user.id,
      is_travel_owner: (travel.driver_id == current_user.id)
    )

    if public_message.save
      travel = public_message.travel
      unless travel.public_chat_partecipants.any?{|pcp| pcp.user_id == current_user.id}
        travel.public_chat_partecipants.create user_id: current_user.id, travel_id:travel.id
      end
      unless travel.public_chat_partecipants.count == 0
        # puts travel.public_chat_partecipants.to_a.first.user.name
        # NotificationWorker.perform_async("received_a_public_message", current_user.id, Array.new, options = {from_public_chat: true, owner_id:travel.driver.id, travel_id: travel.id})
      end
    end
  end

end  