class SelectedMacroCategory < ApplicationRecord
  belongs_to :room_category
  belongs_to :macro_category
end
