class CreateSelectedMacroCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :selected_macro_categories do |t|
      t.belongs_to :room_category
      t.belongs_to :macro_category

      t.timestamps
    end
  end
end
