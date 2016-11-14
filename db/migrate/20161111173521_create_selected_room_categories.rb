class CreateSelectedRoomCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :selected_room_categories do |t|
      t.belongs_to :room
      t.belongs_to :room_category

      t.timestamps
    end
  end
end
