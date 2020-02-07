class ChangeDatatypeDeliveryDayOfProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :delivery_day, :string, null:false
  end
end
