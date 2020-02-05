class ChangeDatatypeTel < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :tel, :integer, null: true
  end
end
