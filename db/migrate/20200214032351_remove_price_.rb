class RemovePrice < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :price, :integer, null:false
  end
end
