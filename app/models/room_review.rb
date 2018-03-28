class RoomReview < ApplicationRecord
  belongs_to :room
  belongs_to :author, class_name: "User"
end
