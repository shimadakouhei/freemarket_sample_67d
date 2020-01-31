class AddpasswordConfiramationTousers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password_confiramation, :string, null :false
  end
end
