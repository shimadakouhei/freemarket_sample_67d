class ChangeDatatypePriceOfProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :price, :integer, null: true
  end
end
