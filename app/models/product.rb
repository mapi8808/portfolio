class Product < ApplicationRecord
  # ユーザーテーブルと関連付け
  belongs_to :user
  attachment :image
  has_many :favorites, dependent: :destroy
  has_many :product_comments, dependent: :destroy
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
end
