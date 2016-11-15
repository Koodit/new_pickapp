class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable, :mailchimp,
          :confirmable, :omniauthable, :omniauth_providers => [:facebook]

  has_one :social_master_badge
  has_one :citizen_badge
  has_one :parents_control
  has_one :driver_detail

  has_many :social_master_badge_relations
  has_many :cars
  has_many :notifications_as_receiver, class_name: "Notification", foreign_key: "receiver_id"
  has_many :notifications_as_emitter, class_name: "Notification", foreign_key: "emitter_id"
  has_many :travel_requests, foreign_key: "passenger_id"
  has_many :room_reviews, foreign_key: "author_id"
  has_many :travel_reviews
  has_many :private_chats_as_driver, class_name: "PrivateChat", foreign_key: "driver_id"
  has_many :private_chats_as_passenger, class_name: "PrivateChat", foreign_key: "passenger_id"
  has_many :public_messages, foreign_key: "author_id"
  has_many :private_messages, foreign_key: "author_id"
  has_many :travels_as_driver, class_name: "Travel", foreign_key: "driver_id", dependent: :destroy
  has_many :travel_reviews_as_target, class_name: "TravelReview", foreign_key: "target_id"

  has_many :user_badges
  has_many :badges, through: :user_badges

  has_many :preferred_rooms
  has_many :rooms, through: :preferred_rooms

  has_many :administrated_rooms
  has_many :rooms, through: :administrated_rooms

  has_many :school_room_partecipants
  has_many :rooms, through: :school_room_partecipants

  has_many :travel_request_chat_partecipants
  has_many :travel_requests, through: :travel_request_chat_partecipants

  has_many :public_chat_partecipants
  has_many :travels, through: :public_chat_partecipants

  has_many :passenger_travels
  has_many :travels, through: :passenger_travels

  has_many :applied_users
  has_many :travels, through: :applied_users

  has_many :approved_users
  has_many :travels, through: :applied_users

  has_attached_file :profile_image,
                    styles: {
                      thumb: '200x200>',
                      medium: '500x500#',
                      large: '1000x1000>'
                    },
                    default_url: "http://koodit.s3.amazonaws.com/pickapp/shared/sample/missing.png",
                    path: "pickapp/:class/:attachment/:id/:style/:filename.:extension",
                    preserve_files: "true",
                    url: ":s3_domain_url",
                    s3_region: "eu-west-1"

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :profile_image, content_type: /\Aimage\/.*\Z/

  validates_presence_of :name, :surname, :birth_date, :nickname

  if Rails.env.development?
    before_save :skip_confirmation!
  end

  before_validation do
    self.uid = email if uid.blank?
    self.provider = "email" if provider.blank?
  end

  def full_name
    "#{name} #{surname}"
  end

  def profile_image_url
    if profile_image.present?
      profile_image.url
    elsif object.provider == "facebook"
      "#{object.image}?width=400&height=400"
    else
      "https://s3-eu-west-1.amazonaws.com/koodit/pickapp/shared/missing_user_photo.jpg"
    end
  end

  def unread_notifications
    notifications_as_receiver.not_messages.unclicked.count
  end

  def unread_messages
    notifications_as_receiver.messages.unclicked.count
  end

  def travels_count
    travels.count
  end

  def reviews_count
    travel_reviews.count
  end

end
