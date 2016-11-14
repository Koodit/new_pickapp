class CreatePrivateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :private_messages do |t|
      t.text :content
      t.boolean :read, default: false
      t.integer :author_id, index: true
      t.belongs_to :private_chat

      t.timestamps
    end
  end
end
