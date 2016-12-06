class ReviewToDoSerializer < ActiveModel::Serializer
  attributes :id, :travel_id
  has_one :target, serializer: SlimUserSerializer

  def target
    object.target
  end
end
