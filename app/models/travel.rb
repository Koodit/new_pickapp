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
end
