class Notification < ApplicationRecord
  belongs_to :emitter, class_name: "User"
  belongs_to :receiver, class_name: "User"

  def self.unclicked
    where(clicked: false)
  end

  def self.messages
    where(is_message: true)
  end

  def self.not_messages
    where(is_message: false)
  end

  # after_create do |notification|
  #   stripped_message = ActionView::Base.full_sanitizer.sanitize(notification.body)
  #   notification.receiver.notify title: notification.title, message: stripped_message
  # end

end
