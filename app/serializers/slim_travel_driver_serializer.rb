class SlimTravelDriverSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :surname, :profile_image_url

  def profile_image_url
    if object.profile_image.file?
      object.profile_image.url
    elsif object.provider == "facebook"
      "#{object.image}?width=400&height=400"
    else
      "https://s3-eu-west-1.amazonaws.com/pickapp.bucket/shared/missing_user_photo.jpg"
    end
  end
end
