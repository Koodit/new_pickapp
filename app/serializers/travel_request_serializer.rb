class TravelRequestSerializer < ActiveModel::Serializer
  attributes :id, :is_owner, :one_way_datetime, :is_one_way, :back_datetime, :lat, :lng, :starting_address, :destination_address, :can_repay, :note,
  :towards_room, :only_with_feedback, :flexible_departure

  has_one :passenger, serializer: SlimTravelRequestPassengerSerializer
  has_many :public_messages, each_serializer: TravelRequestMessageSerializer
  has_one :room, serializer: SlimRoomSerializer

  def passenger
    object.passenger
  end

  def public_messages
    object.travel_request_messages.order(created_at: :desc)
  end

  def is_owner
    scope.current_user == object.passenger
  end
end
