class AddhuriganaFirstNameTousers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :hurigana_first_name, :string, null: false
  end
end
