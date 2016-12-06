class PrivateChatSerializer < ActiveModel::Serializer
  attributes :id, :created_at

  has_one :passenger, serializer: SlimUserSerializer
  has_one :driver, serializer: SlimUserSerializer

  def passenger
    object.passenger
  end

  def driver
    object.driver
  end
end
