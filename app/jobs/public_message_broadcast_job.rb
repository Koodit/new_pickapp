class PublicMessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(public_message)
    ActionCable.server.broadcast "travel_#{public_message.travel_id}_public_messages", public_message: render_message(public_message)
  end

  private

  def render_message(public_message)
    PublicMessagesController.render partial: 'public_messages/public_message', locals: {public_message: public_message}
  end
end
