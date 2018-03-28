class CreateTravels < ActiveRecord::Migration[5.0]
  def change
    create_table :travels do |t|
      t.string :starting_address
      t.string :completion_token
      t.boolean :completed, default: false
      t.boolean :waiting_for_confirm, default: false
      t.datetime :departure_datetime
      t.boolean :towards_room, default: false
      t.float :starting_lat
      t.float :starting_lng
      t.string :destination_address
      t.float :destination_lat
      t.float :destination_lng
      t.boolean :is_recursive
      t.boolean :flexible_departure
      t.boolean :only_with_feedback
      t.boolean :can_repay

      t.integer :driver_id, index: true
      t.belongs_to :room
      t.belongs_to :car

      t.timestamps
    end
  end
end
