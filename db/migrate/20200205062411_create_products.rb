class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :conditions
      t.string :delivery_charge, null: false
      t.string :prefecture, null: false
      t.string :delivery_day, null:false
      t.text :text
      t.integer :user_id, null:false, foreign_key: true
      t.integer :category_id, null:false,foreign_key: true
      t.integer :brand_id, null:true,foreign_key: true
      t.integer :price
      t.timestamps
    end
  end
end
