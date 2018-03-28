class Badge < ApplicationRecord
  belongs_to :badge_category

  has_many :user_badges
  has_many :users, through: :user_badges
end
