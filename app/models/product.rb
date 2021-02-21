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
    favorites.where(user_id: crrent_user).exists?
  end
  
  def Product.search(search, how_search, shop_or_product)
    if shop_or_product == "2"
      if how_search == "1"
        Product.where(['title LIKE ?', "#{search}"])
      elsif how_search == "2"
        Product.where(['title LIKE ?', "%#{search}%"])
      else
        Product.all
      end
    end
  end

end
