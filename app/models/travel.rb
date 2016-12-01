class Travel < ApplicationRecord
  belongs_to :car
  belongs_to :driver, class_name: 'User'
  belongs_to :room

  has_many :travel_stops
  has_many :private_chats
  has_many :travel_reviews
  has_many :public_messages

  has_many :public_chat_partecipants
  has_many :users, through: :public_chat_partecipants

  has_many :passenger_travels
  has_many :users, through: :passenger_travels

  has_many :applied_users
  has_many :users, through: :applied_users

  has_many :approved_users
  has_many :users, through: :approved_users

  accepts_nested_attributes_for :travel_stops,
                                reject_if: :all_blank,
                                allow_destroy: true

  validates_presence_of :car_id,
                        :desired_address,
                        :city,
                        :zip_code,
                        :departure_datetime

  validates_presence_of :repetions_amount, if: :is_recursive?
  validates_presence_of :back_departure_datetime, if: :is_backwards_too?

  scope :available_now, -> { where("departure_datetime > ?", Time.now) }
  scope :next_24_hours, -> { where(departure_datetime: Time.now..(Time.now + 60.day)) }
  scope :by_imminence, -> { order(departure_datetime: :asc) }
  scope :completed, -> { where(completed: true) }
  scope :not_completed, -> { where(completed: false) }
  scope :recursive, -> { where(is_recursive: true) }

  before_save :set_address
  before_save :set_coordinates
  before_save :set_completion_token

  attr_writer :city
  attr_writer :zip_code
  attr_writer :desired_address
  attr_writer :backwards_too
  attr_writer :back_departure_datetime
  attr_writer :repetions_amount
  attr_writer :min_departure_datetime
  attr_writer :max_departure_datetime

  def city
    @city ||= ""
  end

  def zip_code
    @zip_code ||= ""
  end

  def desired_address
    @desired_address ||= ""
  end

  def backwards_too
    @backwards_too ||= false
  end

  def back_departure_datetime
    @back_departure_datetime
  end

  def repetions_amount
    @repetions_amount
  end

  def min_departure_datetime
    @min_departure_datetime
  end

  def max_departure_datetime
    @max_departure_datetime
  end

  def passenger_name
    "#{driver.name} #{driver.surname}"
  end

  def has_not_flexible_departure
    flexible_departure == false
  end

  def cannot_repay
    can_repay == false
  end

  def cannot_smoke
    car.can_smoke == false
  end

  def animals_not_allowed
    car.animals_allowed == false
  end

  def is_not_recursive
    is_recursive == false
  end

  def is_recursive?
    is_recursive == true
  end

  def is_backwards_too?
    backwards_too == true
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
    if self.starting_lat.nil?
      start_loc = Geocoder.search(self.starting_address)
      unless start_loc[0].nil?
        self.starting_lat = start_loc[0].latitude
        self.starting_lng = start_loc[0].longitude
      end
      destination_loc = Geocoder.search(self.destination_address)
      unless destination_loc[0].nil?
        self.destination_lat = destination_loc[0].latitude
        self.destination_lng = destination_loc[0].longitude
      end
    end
  end

  def set_completion_token
    str = self.completion_token
    until str != self.completion_token
      str = SecureRandom.base64
    end
    self.completion_token = str
  end

  def fire_notification_for_completion
    unless self.waiting_for_confirm || self.completed
      NotificationWorker.perform_at(self.departure_datetime + 30.minutes, "travel_expired_for_driver", nil, self.driver_id, options = { travel_expired_for_driver: true, travel_id: self.id, completion_token: self.completion_token })
    end
  end
end
