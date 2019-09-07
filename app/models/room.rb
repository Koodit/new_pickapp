class Room < ApplicationRecord
  searchkick

  belongs_to :room_category

  has_one :school_room_setting, dependent: :destroy
  has_one :private_room_setting

  has_many :room_images
  has_many :travel_requests
  has_many :room_reviews
  has_many :travels, dependent: :destroy
  has_many :travel_reviews

  has_many :preferred_rooms
  has_many :users, through: :preferred_rooms

  has_many :administrated_rooms
  has_many :users, through: :administrated_rooms

  has_many :school_room_partecipants
  has_many :users, through: :school_room_partecipants

  has_attached_file :background_image,
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
  validates_attachment_content_type :background_image, content_type: /\Aimage\/.*\Z/

  accepts_nested_attributes_for :room_images, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :school_room_setting, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :name, :room_category, :address,
                        :start_date, :end_date

  validates_presence_of :school_room_setting, if: :is_school?

  validates_presence_of :room_category

  before_save :set_coordinates

  require 'textacular'
  ActiveRecord::Base.extend(Textacular)

  def is_active?
    end_date >= Time.now
  end

  def self.active
    where("end_date >= ?", Time.now)
  end

  def self.latest
    active.order(created_at: :desc).first
  end

  def is_favourite?(user)
    preferred_rooms.any?{ |pr| pr.user_id == user.id }
  end

  def self.searchable_language
    'italian'
  end

  def image_url(size)
    if background_image.present?
      background_image.url(size)
    else
      if room_category.image.present?
        room_category.image.url(size)
      end
    end
  end

  def is_school?
    is_school == true
  end

  private

  def set_coordinates
    if self.lat.nil?
      loc = Geocoder.search(self.address)
      unless loc.nil?
        if loc.length > 0
          self.lat = loc[0].latitude
          self.long = loc[0].longitude
        end
      end
    end
  end

end
