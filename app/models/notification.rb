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

end
