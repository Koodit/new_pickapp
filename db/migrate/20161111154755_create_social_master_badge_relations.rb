class CreateSocialMasterBadgeRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :social_master_badge_relations do |t|
      t.belongs_to :user
      t.belongs_to :social_master_badge

      t.timestamps
    end
  end
end
