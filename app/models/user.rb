class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :family_name, presence: true,format: { with: /\A[一-龥]+\z/, message: 'は漢字を入力してください'}
  validates :first_name, presence: true,format:{ with: /\A[一-龥]+\z/, message: 'は漢字を入力してください'}
  validates :hurigana_family_name, presence: true,format:{ with: /\A[ぁ-んー－]+\z/, message: 'は全角平仮名を入力してください'}
  validates :hurigana_first_name, presence: true,format:{ with: /\A[ぁ-んー－]+\z/, message: 'は全角平仮名を入力してください'}
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_date, presence: true



  has_many :cards
  has_one :address
  accepts_nested_attributes_for :address
  
  has_many :comennts
  has_many :favorites
  has_many :products
         
end
