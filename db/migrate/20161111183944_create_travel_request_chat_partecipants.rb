class CreateTravelRequestChatPartecipants < ActiveRecord::Migration[5.0]
  def change
    create_table :travel_request_chat_partecipants do |t|
      t.belongs_to :travel_request
      t.belongs_to :user

      t.timestamps
    end
  end
end
