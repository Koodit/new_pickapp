class PublicMessage < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :travel

  after_create_commit { PublicMessageBroadcastJob.perform_later(self) }
end
