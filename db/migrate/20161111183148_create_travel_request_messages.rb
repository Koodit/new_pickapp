class CreateTravelRequestMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :travel_request_messages do |t|
      t.text :content
      t.integer :integer, default: 0
      t.boolean :is_request_owner, default: false
      t.integer :author_id, index: true
      t.belongs_to :travel_request

      t.timestamps
    end
  end
end
