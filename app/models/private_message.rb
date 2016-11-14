class PrivateMessage < ApplicationRecord
  belongs_to :private_chat
  belongs_to :author, class_name: "User"
end
