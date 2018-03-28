class CreateTravelReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :travel_reviews do |t|
      t.text :content
      t.integer :rating, default: 0
      t.boolean :made_by_driver, default: false
      t.boolean :to_be_written, default: false
      t.integer :target_id, index: true
      t.belongs_to :room
      t.belongs_to :travel
      t.belongs_to :user

      t.timestamps
    end
  end
end
