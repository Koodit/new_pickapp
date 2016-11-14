class Notification < ApplicationRecord
  belongs_to :emitter, class_name: "User"
  belongs_to :receiver, class_name: "User"
end
