class UserTravelSerializer < ActiveModel::Serializer
  attributes :id, :is_owner, :applied_count, :approved_count, :available_sits,
  :departure_datetime, :starting_lat, :starting_lng, :starting_address, :destination_lat, :destination_lng,
  :is_applied, :is_approved, :has_private_chat,
  :private_chat_id, :is_passenger, :waiting_for_confirm, :completed, :towards_room, :destination_address,
  :flexible_departure, :only_with_feedback, :can_repay

  has_one :driver, serializer: SlimTravelDriverSerializer
  has_one :car
  has_one :room, serializer: SlimRoomSerializer
  has_many :public_messages, each_serializer: PublicMessageSerializer

  has_many :travel_stops

  has_many :reviews_done, each_serializer: ReviewDoneSerializer
  has_many :reviews_to_be_done, each_serializer: ReviewToDoSerializer
  has_many :reviews_received, each_serializer: ReviewReceivedSerializer

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

  def has_private_chat
    PrivateChat.where(passenger_id: scope.current_user.id).where(travel_id: object.id).count > 0
  end

  def private_chat_id
    pc = PrivateChat.where(passenger_id: scope.current_user.id).where(travel_id: object.id)
    if pc.any?
      pc.first.id
    end
  end

  def public_messages
    object.public_messages.order(created_at: :desc)
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

  def is_applied
    object.applied_users.include?(scope.current_user)
    if AppliedUser.where(user_id: scope.current_user.id).where(travel_id: object.id).count > 0
      true
    else
      false
    end
  end

  def is_passenger
    if object.passenger_travels.any?{|pt| pt.user_id == scope.current_user.id}
      true
    else
      false
    end
  end

  def is_approved
    object.approved_users.include?(scope.current_user)
    if ApprovedUser.where(user_id: scope.current_user.id).where(travel_id: object.id).count > 0
      true
    else
      false
    end
  end

  def available_sits
    object.car.sits
  end

  def is_owner
    scope.current_user == object.driver
  end
end
