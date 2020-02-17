class RenamePayIdColumnToCards < ActiveRecord::Migration[5.2]
  def change
    rename_column :cards, :pay_id, :card_id
  end
end
