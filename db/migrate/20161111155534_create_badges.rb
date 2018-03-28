class CreateBadges < ActiveRecord::Migration[5.0]
  def change
    create_table :badges do |t|
      t.string :name
      t.text :description
      t.integer :value, default: 0
      t.belongs_to :badge_category

      t.timestamps
    end
  end
end
