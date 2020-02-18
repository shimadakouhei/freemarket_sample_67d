class Product < ApplicationRecord

has_many :images, dependent: :destroy
accepts_nested_attributes_for :images, allow_destroy: true

belongs_to :category
belongs_to :user
belongs_to :seller, class_name: "User", optional: true
belongs_to :buyer, class_name: "User", optional: true

validates :delivery_charge, :prefecture, :delivery_day, :text, :price, presence: true
validates :name,        presence: true,
                        length: { minimum: 1, maximum: 40 }
validates :conditions,  presence: true,
                        length: { minimum: 1, maximum: 1000 }

validates :images,      presence: true

  validates :name, :price, :text, presence: true
extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :todoufuken
  belongs_to_active_hash :delivery

end
