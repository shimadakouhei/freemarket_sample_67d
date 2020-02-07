class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :hurigana_family_name, presence: true
  validates :hurigana_first_name, presence: true
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
