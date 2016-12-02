class PreferredRoom < ApplicationRecord
  belongs_to :user
  belongs_to :room

  def self.active
    select { |pr| pr.room.is_active? }
  end
end
