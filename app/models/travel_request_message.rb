class TravelRequestMessage < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :travel_request
end
