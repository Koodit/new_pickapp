class SchoolRoomSerializer < ActiveModel::Serializer
  attributes :id, :admin_editable, :name, :rating, :number_of_ratings, :price, :start_date,
  :end_date, :is_private, :address, :lat, :long, :description,
  :phone, :website, :facebook, :twitter, :instagram, :trip_advisor,
  :is_favourite, :image_url, :preferred_count, :can_review, :share_link, :share_code,
  :school_representative, :non_partecipant_message, :referral_link, :email_domain, :is_school,
  :room_category

  has_many :travels, each_serializer: SlimTravelSerializer
  has_many :travel_requests, each_serializer: SlimTravelRequestSerializer
  has_many :latest_reviews, each_serializer: RoomReviewSerializer

  def room_category
    object.room_category
  end

  def latest_reviews
    object.room_reviews.order(created_at: :desc).limit(2)
  end

  def share_link
  	object.school_room_setting.share_link
  end

  def share_code
  	object.school_room_setting.code
  end

  def school_representative
    object.school_room_setting.school_representative
  end

  def non_partecipant_message
    object.school_room_setting.non_partecipant_message
  end

  def referral_link
    object.school_room_setting.referral_link
  end

  def email_domain
    object.school_room_setting.email_domain
  end

  def can_review
    if object.travel_reviews.any?{|tr| tr.user_id == scope.current_user.id}
      if object.room_reviews.any?{|rr| rr.author_id == scope.current_user.id}
        false
      else
        true
      end
    else
      false
    end
  end

  def travel_requests
    TravelRequest.where(room_id: object.id).next_24_hours.by_imminence
  end

  def travels
    Travel.where(room_id: object.id).next_24_hours.by_imminence.not_completed
  end

  def is_favourite
    object.preferred_rooms.any?{|pr| pr.user_id == scope.current_user.id}
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
