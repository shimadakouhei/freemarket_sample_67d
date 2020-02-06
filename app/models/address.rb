class Address < ApplicationRecord
  validates :postal_code, presence: true
  validates :administrative＿divisions, presence: true
  validates :city, presence: true
  validates :street_number, presence: true
  belongs_to :user,  optional: true
end
