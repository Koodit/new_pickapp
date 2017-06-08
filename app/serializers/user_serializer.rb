class UserSerializer < ActiveModel::Serializer
  attributes :id, :birth_date, :name, :surname, :genre, :address, :comune, :prov, :is_driver, :is_verified, :nickname, :email, :role, :pending_driver_verification, :profile_image_url, :car_count, :citizen_badge, :zip_code

  def profile_image_url
    if object.profile_image.present?
      object.profile_image.url(:medium)
    elsif object.provider == "facebook"
      "#{object.image}?width=400&height=400"
    else
      "https://s3-eu-west-1.amazonaws.com/pickapp.bucket/shared/missing_user_photo.jpg"
    end
  end

  def citizen_badge
  	object.citizen_badge
  end
end
