class TravelReviewAuthorSerializer < ActiveModel::Serializer
  attributes :id, :content, :made_by_driver, :rating, :to_be_written

  has_one :target, serializer: SlimUserSerializer

  def target
    object.target
  end
end
