class CreateSocialMasterBadges < ActiveRecord::Migration[5.0]
  def change
    create_table :social_master_badges do |t|
      t.integer :relations_count, default: 0
      t.float :completion_percentage, default: 0
      t.boolean :completed, default: false
      t.belongs_to :user

      t.timestamps
    end
  end
end
