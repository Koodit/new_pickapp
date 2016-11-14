class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string :title
      t.string :body
      t.boolean :from_user, default: false
      t.string :icon
      t.boolean :favorite, default: false
      t.string :event
      t.boolean :clicked, default: false
      t.integer :importance, default: 0
      t.integer :emitter_id
      t.integer :receiver_id, index: true
      t.text :params
      t.string :link
      t.boolean :is_message, default: false

      t.timestamps
    end
  end
end
