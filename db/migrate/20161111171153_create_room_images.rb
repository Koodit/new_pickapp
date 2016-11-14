class CreateRoomImages < ActiveRecord::Migration[5.0]
  def change
    create_table :room_images do |t|
      t.attachment :image
      t.belongs_to :room

      t.timestamps
    end
  end
end
