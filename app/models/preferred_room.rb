class PreferredRoom < ApplicationRecord
  belongs_to :user
  belongs_to :room

  def self.active
    select { |pr| pr.room.end_date >= Time.now }
  end
end
