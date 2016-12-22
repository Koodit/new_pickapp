class TravelRequestMessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(travel_request_message, user_requester_id)
    ActionCable.server.broadcast "travel_request_#{travel_request_message.travel_request_id}_public_messages", travel_request_message: render_message(travel_request_message, user_requester_id), sender_id: user_requester_id
  end

  private

  def render_message(travel_request_message, user_requester_id)
    TravelRequestMessagesController.render partial: 'travel_request_messages/travel_request_message', locals: {travel_request_message: travel_request_message, user_requester_id: user_requester_id, use_requester_id: false}
  end
end
