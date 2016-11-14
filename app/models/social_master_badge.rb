class SocialMasterBadge < ApplicationRecord
  belongs_to :user
  has_many :social_master_badge_relations
end
