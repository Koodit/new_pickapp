class RoomReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :rating, :room_id

  has_one :author, serializer: SlimUserSerializer

  def author
    object.author
  end
end
