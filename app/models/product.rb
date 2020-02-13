class Product < ApplicationRecord

has_many :images
accepts_nested_attributes_for :images, allow_destroy: true

  belongs_to :category
  belongs_to :user
end
