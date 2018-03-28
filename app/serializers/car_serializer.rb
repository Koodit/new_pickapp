class CarSerializer < ActiveModel::Serializer
  attributes :id, :plate, :sits, :can_smoke, :animals_allowed, :cc, :notes, :model, :car_category_id
end
