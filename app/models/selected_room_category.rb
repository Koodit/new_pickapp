class SelectedRoomCategory < ApplicationRecord
  belongs_to :room_category
  belongs_to :room
end
