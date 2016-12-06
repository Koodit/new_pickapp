class RestrictSchoolRoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :lat, :long, :description,
  :phone, :website, :facebook, :twitter, :instagram, :trip_advisor,
  :image_url, :preferred_count, :non_partecipant_message, :is_restricted,
  :room_category

  def room_category
    object.room_category
  end

  def is_restricted
    true
  end

  def non_partecipant_message
  	object.school_room_setting.non_partecipant_message
  end

  def preferred_count
    object.preferred_rooms.count
  end

  def image_url
    if object.background_image.file?
      object.background_image.url
    else
      object.room_category.image.url
    end
  end

end
