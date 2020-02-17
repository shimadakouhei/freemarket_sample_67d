class Address < ApplicationRecord
  validates :postal_code, presence: true, format:{ with: /\A\d{7}\z/, message: 'はで入力をお願いします'}
  validates :administrative＿divisions, presence: true,format:{ with: /\A[ぁ-んー－]+\z/, message: 'は漢字で入力をお願いします'}
  validates :city, presence: true
  validates :street_number, presence: true
  validates :tel,length: { maximum: 13, too_long: 'は8文字以内で記入してください'}
  
  belongs_to :user,  optional: true
end


