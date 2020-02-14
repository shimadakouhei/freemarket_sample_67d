class AddProductIdToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :product, :integer
  end
end
