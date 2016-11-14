class CreateTravelRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :travel_requests do |t|
      t.string :starting_address
      t.float :lat
      t.float :lng
      t.boolean :is_one_way, default: false
      t.datetime :one_way_datetime
      t.datetime :back_datetime
      t.boolean :towards_room, default: false
      t.boolean :can_repay, default: false
      t.string :destination_address
      t.text :note
      t.boolean :flexible_departure, default: false
      t.boolean :only_with_feedback, default: false

      t.integer :passenger_id, index: true
      t.belongs_to :room

      t.timestamps
    end
  end
end
