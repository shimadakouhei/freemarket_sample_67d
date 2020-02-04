class RemovepasswordConfiramationFromusers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :password_confiramation, :string, null: false
  end
end
