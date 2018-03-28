class SlimUserTravelSerializer < ActiveModel::Serializer
  attributes :id, :starting_lat, :starting_lng, :destination_lat, :destination_lng,
  :departure_datetime, :starting_address, :is_owner,
  :completed, :waiting_for_confirm, :only_with_feedback, :can_repay

  has_one :user, serializer: SlimTravelDriverSerializer

  has_one :room, serializer: SlimRoomSerializer

  def room
    object.room
  end

  def user
    object.driver
  end

  def is_owner
    scope.current_user == object.driver
  end
end
