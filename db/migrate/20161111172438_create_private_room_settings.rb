class CreatePrivateRoomSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :private_room_settings do |t|
      t.string :referral_domain
      t.boolean :admin_permission, default: false
      t.text :why_restrict
      t.belongs_to :room

      t.timestamps
    end
  end
end
