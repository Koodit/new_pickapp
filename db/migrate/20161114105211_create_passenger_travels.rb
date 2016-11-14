class CreatePassengerTravels < ActiveRecord::Migration[5.0]
  def change
    create_table :passenger_travels do |t|
      t.belongs_to :user
      t.belongs_to :travel

      t.timestamps
    end
  end
end
