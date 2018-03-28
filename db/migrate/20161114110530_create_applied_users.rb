class CreateAppliedUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :applied_users do |t|
      t.integer :notification_id
      t.belongs_to :user
      t.belongs_to :travel

      t.timestamps
    end
  end
end
