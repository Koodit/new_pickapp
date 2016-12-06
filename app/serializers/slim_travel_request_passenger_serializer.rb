class SlimTravelRequestPassengerSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :surname, :image_url

  def image_url
    if object.profile_image.file?
      object.profile_image.url
    elsif object.provider == "facebook"
      "#{object.image}?width=400&height=400"
    else
      "https://s3-eu-west-1.amazonaws.com/koodit/pickapp/shared/missing_user_photo.jpg"
    end
  end
end
