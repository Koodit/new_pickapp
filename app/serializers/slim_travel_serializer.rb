class SlimTravelSerializer < ActiveModel::Serializer

  attributes :id, :is_owner,
  :departure_datetime, :destination_address, :destination_lat, :destination_lng,
  :starting_address, :starting_lat, :starting_lng, :towards_room, :flexible_departure, :only_with_feedback, :can_repay

  has_one :user, serializer: SlimTravelDriverSerializer

  has_many :travel_stops

  has_one :room, serializer: SlimRoomSerializer

  def room
    object.room
  end
  

  def user
    object.driver
  end

  def is_owner
    unless scope.nil?
      scope.current_user == object.driver
    end
  end
end
