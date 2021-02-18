class Product < ApplicationRecord
  # ユーザーテーブルと関連付け
  belongs_to :user
  belongs_to :shop
  # optional: trueを使ってshopのidをnillでも入力可能に。（そもそも一般ユーザー側で新規登録できないようにビューに反映していない。）。
  attachment :image
  belongs_to :genre
  has_many :favorites, dependent: :destroy
  has_many :productcomments, dependent: :destroy

  def favorited_by?(crrent_user)
    favorites.where(user_id: crrent_user.id).exists?
  end

end
