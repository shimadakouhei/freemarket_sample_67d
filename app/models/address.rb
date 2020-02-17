class Address < ApplicationRecord
  validates :postal_code, presence: true, length: { maximum: 8, too_long: 'は8文字以内で記入してください'}
  validates :administrative＿divisions, presence: true
  validates :street_number, presence: true
  validates :tel,length: { maximum: 13, too_long: 'は8文字以内で記入してください'}
  
  belongs_to :user,  optional: true
end


