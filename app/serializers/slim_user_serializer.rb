class SlimUserSerializer < ActiveModel::Serializer
  attributes :id, :birth_date, :name, :surname, :email, :profile_image_url

  def profile_image_url
    if object.profile_image.file?
      object.profile_image.url
    elsif object.provider == "facebook"
      "#{object.image}?width=400&height=400"
    else
      "https://s3-eu-west-1.amazonaws.com/koodit/pickapp/shared/missing_user_photo.jpg"
    end
  end
end
