class Image < ApplicationRecord
t.string :src
t.references :product, foreign_key: true
mount_uploader :src, ImageUploader
belongs_to :product
end
