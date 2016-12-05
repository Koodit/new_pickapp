class TravelReview < ApplicationRecord
  belongs_to :user
  belongs_to :travel
  belongs_to :room
  belongs_to :target, class_name: "User"

  scope :already_written, -> { where(to_be_written: false) }
  scope :to_be_written, -> { where(to_be_written: true) }
  scope :made_by_driver, -> { where(made_by_driver: true) }
  scope :made_by_passenger, -> { where(made_by_driver: false) }

  after_save :notification_for_reminder

  def notification_for_reminder
    if self.to_be_written
      NotificationWorker.perform_at(self.updated_at + 2.minutes, "reminder_for_review", nil, self.user_id, options = { reminder_for_review: true, travel_review_id: self.id, user_to_review_id: self.target_id })
    end
  end
end
