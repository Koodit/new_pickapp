class TravelRequestMessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(public_message, user_requester_id)
    ActionCable.server.broadcast "travel_request_#{public_message.travel_id}_public_messages", public_message: render_message(public_message, user_requester_id), sender_id: user_requester_id
  end

  private

  def render_message(public_message, user_requester_id)
    TravelRequestMessagesController.render partial: 'public_messages/public_message', locals: {public_message: public_message, user_requester_id: user_requester_id, use_requester_id: false}
  end
end
