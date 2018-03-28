class SlimRoomSerializer < ActiveModel::Serializer
  attributes :id, :admin_editable, :name, :rating, :number_of_ratings,
             :price, :end_date, :is_private, :address, :lat, :long, :is_favourite,
             :image_url, :preferred_count, :is_school

  def is_school
    if object.is_school
      true
    else
      false
    end
  end

  def is_favourite
    object.preferred_rooms.any?{ |pr| pr.user_id == scope.current_user.id }
  end

  def preferred_count
    object.preferred_rooms.count
  end

  def image_url
    if object.background_image.present?
      object.background_image.url
    else
      if object.room_category.image.present?
        object.room_category.image.url
      end
    end
  end

end
