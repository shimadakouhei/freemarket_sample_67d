class ChangeDatatypeApartment < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :apartment, :string, null: true
  end
end