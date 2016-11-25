class TravelRequest < ApplicationRecord
  belongs_to :passenger, class_name: 'User'
  belongs_to :room

  has_many :travel_request_messages

  has_many :travel_request_chat_partecipants
  has_many :users, through: :travel_request_chat_partecipants

  before_save :set_address
  before_save :set_coordinates

  scope :available_now, -> { where("one_way_datetime > ?", Time.now) }
  scope :next_24_hours, -> { where(one_way_datetime: Time.now..(Time.now + 60.day)) }
  scope :by_imminence, -> { order(one_way_datetime: :asc) }

  attr_writer :city
  attr_writer :zip_code
  attr_writer :desired_address

  def city
    @city ||= ""
  end

  def zip_code
    @zip_code ||= ""
  end

  def desired_address
    @desired_address ||= ""
  end

  def passenger_name
    "#{passenger.name} #{passenger.surname}"
  end

  private

  def set_address
    if self.towards_room == true
      self.destination_address = self.room.address
      self.starting_address = "#{@desired_address} #{@zip_code} #{@city}"
    else
      self.starting_address = self.room.address
      self.destination_address = "#{@desired_address} #{@zip_code} #{@city}"
    end
  end

  def set_coordinates
    if self.lat.nil?
      loc = Geocoder.search(self.starting_address)
      unless loc.empty?
        self.lat = loc[0].latitude
        self.lng = loc[0].longitude
      end
    end
  end
  
end
