class ChangeDatatypePayId < ActiveRecord::Migration[5.2]
  def change
    change_column :cards, :pay_id, :string, null: false
  end
end
