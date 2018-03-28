class CreatePublicChatPartecipants < ActiveRecord::Migration[5.0]
  def change
    create_table :public_chat_partecipants do |t|
      t.belongs_to :user
      t.belongs_to :travel

      t.timestamps
    end
  end
end
