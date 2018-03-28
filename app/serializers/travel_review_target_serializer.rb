class TravelReviewTargetSerializer < ActiveModel::Serializer
  attributes :id, :content, :rating, :made_by_driver

  has_one :user, serializer: SlimUserSerializer

  def user
    object.user
  end
end
