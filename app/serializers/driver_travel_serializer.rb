class DriverTravelSerializer < ActiveModel::Serializer
  attributes :id, :is_owner, :applied_count, :approved_count, :available_sits,
  :departure_datetime, :destination_address, :destination_lat, :destination_lng,
  :starting_address, :starting_lat, :starting_lng, :towards_room,
  :completed, :waiting_for_confirm, :flexible_departure, :can_repay

  has_one :driver, serializer: SlimTravelDriverSerializer
  has_one :car
  has_one :room, serializer: SlimRoomSerializer

  has_many :applied_users, each_serializer: AppliedUserForDriverSerializer
  has_many :approved_users, each_serializer: AppliedUserForDriverSerializer

  has_many :private_chats, each_serializer: PrivateChatSerializer

  has_many :public_messages, each_serializer: PublicMessageSerializer

  has_many :travel_stops

  def driver
    object.driver
  end

  def private_chats
    object.private_chats
  end

  def public_messages
    object.public_messages.order(created_at: :asc)
  end

  def car
    object.car
  end

  def room
    object.room
  end

  def applied_count
    object.applied_users.count
  end

  def approved_count
    object.approved_users.count
  end

  def available_sits
    object.car.sits
  end

  def is_owner
    scope.current_user == object.driver
  end
end
