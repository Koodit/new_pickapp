class CreateDriverDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :driver_details do |t|
      t.string :license_release_city_common
      t.string :license_release_city
      t.date :license_expire_date
      t.date :license_relase_date
      t.string :license_number
      t.string :license_type
      t.attachment :assicurazione
      t.attachment :patente
      t.belongs_to :user

      t.timestamps
    end
  end
end
