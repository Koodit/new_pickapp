class TravelRequestChatPartecipant < ApplicationRecord
  belongs_to :user
  belongs_to :travel_request
end
