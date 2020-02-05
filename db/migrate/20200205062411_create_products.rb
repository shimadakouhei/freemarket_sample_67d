class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :conditions, null: false
      t.string :delivery_charge, null: false
      t.string :prefecture, null: false
      t.integer :delivery_day, null:false
      t.text :text, null: false
      t.integer :user_id, null:false, foreign_key: true
      t.integer :category_id, null:false,foreign_key: true
      t.integer :brand_id, null:true,foreign_key: true
      t.integer :price, null: false
      t.timestamps
    end
  end
end
