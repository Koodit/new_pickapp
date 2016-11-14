class TravelRequest < ApplicationRecord
  belongs_to :passenger, class_name: 'User'
  belongs_to :room

  has_many :travel_request_messages

  has_many :travel_request_chat_partecipants
  has_many :users, through: :travel_request_chat_partecipants
end
