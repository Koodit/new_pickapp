class PublicChatPartecipant < ApplicationRecord
  belongs_to :user
  belongs_to :travel
end
