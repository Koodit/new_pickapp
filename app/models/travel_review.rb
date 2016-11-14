class TravelReview < ApplicationRecord
  belongs_to :user
  belongs_to :travel
  belongs_to :room
  belongs_to :target, class_name: "User"
end
