class Car < ApplicationRecord
  belongs_to :car_category
  belongs_to :user

  has_many :travels, dependent: :destroy
end
