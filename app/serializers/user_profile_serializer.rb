class UserProfileSerializer < ActiveModel::Serializer
  attributes :id, :name, :surname, :profile_image_url, :received_reviews_score

  has_many :received_reviews, serializer: ReviewReceivedSerializer

  def received_reviews
    object.travel_reviews_as_target.where(to_be_written: false)
  end

  def received_reviews_score
    if object.travel_reviews_as_target.where(to_be_written: false).count > 0
      object.travel_reviews_as_target.where(to_be_written: false).sum(:rating) / object.travel_reviews_as_target.where(to_be_written: false).count
    else
      0
    end
  end

  def profile_image_url
    if object.profile_image.present?
      object.profile_image.url
    elsif object.provider == "facebook"
      "#{object.image}?width=400&height=400"
    else
      "https://s3-eu-west-1.amazonaws.com/koodit/pickapp/shared/missing_user_photo.jpg"
    end
  end
end
