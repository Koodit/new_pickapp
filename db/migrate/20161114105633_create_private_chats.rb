class CreatePrivateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :private_chats do |t|
      t.integer :driver_id, index: true
      t.integer :passenger_id, index: true
      t.belongs_to :travel

      t.timestamps
    end
  end
end
