class UserDriverTravelSerializer < ActiveModel::Serializer
  attributes :id, :is_owner, :applied_count, :approved_count, :available_sits,
  :departure_datetime, :starting_address, :starting_lat, :starting_lng, :destination_lat, 
  :destination_lng, :waiting_for_confirm, :completed, :only_with_feedback, :towards_room,
  :destination_address, :can_repay

  has_one :driver, serializer: SlimTravelDriverSerializer
  has_one :car
  has_one :room, serializer: SlimRoomSerializer

  has_many :applied_users, each_serializer: AppliedUserForDriverSerializer
  has_many :approved_users, each_serializer: AppliedUserForDriverSerializer
  has_many :travel_passengers, each_serializer: AppliedUserForDriverSerializer

  has_many :private_chats, each_serializer: PrivateChatSerializer

  has_many :public_messages, each_serializer: PublicMessageSerializer

  has_many :reviews_done, each_serializer: ReviewDoneSerializer
  has_many :reviews_to_be_done, each_serializer: ReviewToDoSerializer
  has_many :reviews_received, each_serializer: ReviewDoneSerializer

  def room
    object.room
  end

  def reviews_done
    object.travel_reviews.already_written.where(user_id: scope.current_user.id)
  end

  def reviews_to_be_done
    object.travel_reviews.to_be_written.where(user_id: scope.current_user.id)
  end

  def reviews_received
    object.travel_reviews.already_written.where(target_id: scope.current_user.id)
  end

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

  def applied_count
    object.applied_users.count
  end

  def approved_count
    object.approved_users.count
  end

  def travel_passengers
    object.passenger_travels
  end

  def available_sits
    if object.car
      object.car.sits
    end
  end

  def is_owner
    scope.current_user == object.driver
  end
end
