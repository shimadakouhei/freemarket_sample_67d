class AddAncestryToCategori < ActiveRecord::Migration[5.2]
  def change
    add_column :categoris, :ancestry, :string
    add_index :categoris, :ancestry
  end
end
