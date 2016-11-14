class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.boolean :admin_editable, default: false
      t.string :name
      t.float :rating, default: 0
      t.float :total_rating, default: 0
      t.integer :number_of_ratings, default: 0
      t.float :price, default: 0
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :is_private, default: false
      t.string :website
      t.string :facebook
      t.string :twitter
      t.string :instagram
      t.string :trip_advisor
      t.string :phone
      t.string :address
      t.float :lat
      t.float :long
      t.text :description
      t.boolean :is_school, default: false
      t.attachment :background_image

      t.belongs_to :room_category

      t.timestamps
    end
  end
end
