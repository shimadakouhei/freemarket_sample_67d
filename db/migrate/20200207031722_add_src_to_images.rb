class AddSrcToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :src, :string
  end
end
