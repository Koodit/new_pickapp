class TravelRequest < ApplicationRecord
  belongs_to :passenger, class_name: 'User'
  belongs_to :room

  has_many :travel_request_messages

  has_many :travel_request_chat_partecipants
  has_many :users, through: :travel_request_chat_partecipants

  scope :available_now, -> { where("one_way_datetime > ?", Time.now) }
  scope :next_24_hours, -> { where(one_way_datetime: Time.now..(Time.now + 60.day)) }
  scope :by_imminence, -> { order(one_way_datetime: :asc) }

  private

  def set_coordinates
    if self.lat.nil?
      loc = Geocoder.search(self.starting_address)
      unless loc.nil?
        self.lat = loc[0].latitude
        self.lng = loc[0].longitude
      end
    end
  end
  
end
