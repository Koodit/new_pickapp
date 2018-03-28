class RoomCategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url

  has_many :rooms, each_serializer: SlimRoomSerializer

  def image_url
    object.image.url
  end

  def rooms
    object.rooms.active
  end

end
