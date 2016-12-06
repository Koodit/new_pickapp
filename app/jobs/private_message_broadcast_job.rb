class PrivateMessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(private_message, user_requester_id)
    ActionCable.server.broadcast "private_chat_#{private_message.private_chat_id}_messages", private_message: render_message(private_message, user_requester_id), sender_id: user_requester_id 
  end

  private

  def render_message(private_message, user_requester_id)
    PrivateMessagesController.render partial: 'private_messages/private_message', locals: {private_message: private_message, user_requester_id: user_requester_id, use_requester_id: false}
  end
end
