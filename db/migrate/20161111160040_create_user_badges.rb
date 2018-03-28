class CreateUserBadges < ActiveRecord::Migration[5.0]
  def change
    create_table :user_badges do |t|
      t.belongs_to :user
      t.belongs_to :badge

      t.timestamps
    end
  end
end
