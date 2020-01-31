class AddhuriganaFamilyNameTousers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :hurigana_family_name, :string, null: false
  end
end
