class PrivateChat < ApplicationRecord
  belongs_to :travel
  belongs_to :driver, class_name: "User"
  belongs_to :passenger, class_name: "User"

  has_many :private_messages
end
