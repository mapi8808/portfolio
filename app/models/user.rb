class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #商品テーブルと関連付け 
  has_many :products, dependent: :destroy 
  # ショップテーブルと関連付け
  has_many :shops, dependent: :destroy
end
