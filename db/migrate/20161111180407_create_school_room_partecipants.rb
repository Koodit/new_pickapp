class CreateSchoolRoomPartecipants < ActiveRecord::Migration[5.0]
  def change
    create_table :school_room_partecipants do |t|
      t.belongs_to :room
      t.belongs_to :user

      t.timestamps
    end
  end
end
