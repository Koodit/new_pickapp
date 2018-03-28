class CreateSchoolRoomSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :school_room_settings do |t|
      t.string :school_representative
      t.text :non_partecipant_message
      t.string :referral_link
      t.string :share_link
      t.string :code
      t.string :email_domain

      t.belongs_to :room

      t.timestamps
    end
  end
end
