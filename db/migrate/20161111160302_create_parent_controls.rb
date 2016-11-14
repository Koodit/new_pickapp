class CreateParentControls < ActiveRecord::Migration[5.0]
  def change
    create_table :parent_controls do |t|
      t.string :parent_mail
      t.string :code
      t.belongs_to :user

      t.timestamps
    end
  end
end
