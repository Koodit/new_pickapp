class NotificationsController < ApplicationController
  def index
    @messages = current_user.notifications_as_receiver.messages
    @notifications = current_user.notifications_as_receiver.not_messages
  end
end
