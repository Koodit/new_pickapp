class NotificationsController < ApplicationController
  def index
    PickAppMailer.welcome_email.deliver_now
    @messages = current_user.notifications_as_receiver.messages
    @notifications = current_user.notifications_as_receiver.not_messages
  end
end
