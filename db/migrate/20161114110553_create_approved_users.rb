class CreateApprovedUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :approved_users do |t|
      t.belongs_to :user
      t.belongs_to :travel

      t.timestamps
    end
  end
end
