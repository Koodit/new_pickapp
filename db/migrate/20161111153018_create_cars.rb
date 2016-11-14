class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :plate
      t.integer :sits
      t.boolean :can_smoke
      t.boolean :animals_allowed
      t.integer :cc
      t.text :notes
      t.string :model
      t.belongs_to :car_category_id
      t.belongs_to :user

      t.timestamps
    end
  end
end
