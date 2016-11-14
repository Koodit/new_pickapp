class CreateCitizenBadges < ActiveRecord::Migration[5.0]
  def change
    create_table :citizen_badges do |t|
      t.float :completion_percentage, default: 0
      t.boolean :completed
      t.integer :travel_count, default: 0
      t.belongs_to :user

      t.timestamps
    end
  end
end
