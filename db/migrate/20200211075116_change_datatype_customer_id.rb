class ChangeDatatypeCustomerId < ActiveRecord::Migration[5.2]
  def change
    change_column :cards, :customer_id, :string, null: false
  end
end
