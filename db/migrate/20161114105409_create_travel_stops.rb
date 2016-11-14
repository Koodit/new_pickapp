class CreateTravelStops < ActiveRecord::Migration[5.0]
  def change
    create_table :travel_stops do |t|
      t.string :address
      t.float :lat
      t.float :lng
      t.belongs_to :travel

      t.timestamps
    end
  end
end
