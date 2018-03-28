class CreateRoomReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :room_reviews do |t|
      t.text :content
      t.integer :rating, default: 0
      t.integer :author_id, index: true
      t.belongs_to :room

      t.timestamps
    end
  end
end
