class PublicMessage < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :travel
end
