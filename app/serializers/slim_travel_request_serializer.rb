class SlimTravelRequestSerializer < ActiveModel::Serializer
  attributes :id, :back_datetime, :is_one_way, :lat, :lng, :one_way_datetime, :starting_address, :is_owner, :can_repay, :towards_room, :only_with_feedback, :flexible_departure,
  :user

  has_one :user, serializer: SlimTravelDriverSerializer
  has_one :room, serializer: SlimRoomSerializer
  
  def user
    SlimUserSerializer.new(object.driver, scope: scope, root: false)
  end

  def is_owner
    scope.current_user == object.passenger
  end
end
