class AddNameToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :name, :string, null: false
  end
end
