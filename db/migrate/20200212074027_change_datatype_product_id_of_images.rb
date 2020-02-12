class ChangeDatatypeProductIdOfImages < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :images, :products
    remove_index :images, :product_id
    remove_reference :images, :product
  end
end