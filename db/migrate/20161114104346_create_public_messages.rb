class CreatePublicMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :public_messages do |t|
      t.text :content
      t.boolean :is_travel_owner
      t.integer :author_id, index: true
      t.belongs_to :travel

      t.timestamps
    end
  end
end
