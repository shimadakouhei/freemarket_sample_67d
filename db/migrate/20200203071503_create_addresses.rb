class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :postal_code,              null: false
      t.string :administrative＿divisions,  null: false
      t.string :city,                       null: false
      t.string :street_number,              null: false
      t.string :apartment,                  null: false
      t.integer :user_id,                   null: false , foreign_key: true
      t.integer :tel,                      null:false, unique: true
      t.timestamps
    end
  end
end
