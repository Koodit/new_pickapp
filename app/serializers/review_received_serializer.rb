class ReviewReceivedSerializer < ActiveModel::Serializer
  attributes :id, :rating, :content

  has_one :user, serializer: SlimUserSerializer

  def user
    object.user
  end
end
