class ReviewDoneSerializer < ActiveModel::Serializer
  attributes :id, :content, :rating

  has_one :target, serializer: SlimUserSerializer

  def user
    object.target
  end
end
