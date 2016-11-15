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
  has_many :users, through: :applied_users

  scope :available_now, -> { where("departure_datetime > ?", Time.now) }
  scope :next_24_hours, -> { where(departure_datetime: Time.now..(Time.now + 60.day)) }
  scope :by_imminence, -> { order(departure_datetime: :asc) }
  scope :completed, -> { where(completed: true) }
  scope :not_completed, -> { where(completed: false) }
  scope :recursive, -> { where(is_recursive: true) }

  validates :car_id, presence: true

  private
  
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
      NotificationWorker.perform_at(self.departure_datetime + 30.minutes, "travel_expired_for_driver", nil, self.driver.id, options = {travel_expired_for_driver: true, travel_id: self.id, completion_token: self.completion_token})
    end
  end
end
