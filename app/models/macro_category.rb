class MacroCategory < ApplicationRecord
  has_many :selected_macro_categories
  has_many :room_categories, through: :selected_macro_categories
end
