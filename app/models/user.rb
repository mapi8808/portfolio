class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ショップテーブルと関連付け
  has_one :shop, dependent: :destroy
  # has_oneは、一人だけのデータを紐付ける。
  has_many :products, dependent: :destroy
  has_many :productcomments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :name, length:  { in: 1..20 }, presence: true, uniqueness: true
  validates :email, presence: true
end
