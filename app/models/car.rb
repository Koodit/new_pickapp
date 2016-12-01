class Car < ApplicationRecord
  belongs_to :car_category, optional: true
  belongs_to :user

  has_many :travels, dependent: :destroy

  validates_presence_of :model, :plate, :sits
end
