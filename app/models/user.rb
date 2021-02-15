class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ショップテーブルと関連付け
  has_one :shop, dependent: :destroy
  has_many :product_comments, dependent: :destroy
  # has_oneは、一人だけのデータを紐付ける。
end
