class AddbirthYearTousers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birth_year, :integerm, null: false 
  end
end
