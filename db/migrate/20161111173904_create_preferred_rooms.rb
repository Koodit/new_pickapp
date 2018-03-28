class CreatePreferredRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :preferred_rooms do |t|
      t.belongs_to :room
      t.belongs_to :user

      t.timestamps
    end
  end
end
