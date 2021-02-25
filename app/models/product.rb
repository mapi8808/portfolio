class Product < ApplicationRecord
  # ユーザーテーブルと関連付け
  belongs_to :user
  belongs_to :shop
  # optional: trueを使ってshopのidをnillでも入力可能に。（そもそも一般ユーザー側で新規登録できないようにビューに反映していない。）。
  attachment :image
  belongs_to :genre
  has_many :favorites, dependent: :destroy
  has_many :productcomments, dependent: :destroy
  
  validates :product_name, length:  { in: 1..20 }, presence: true #1文字〜20文字まで入力、空白は× 
  validates :image, presence: true #写真も分かりやすくするため、必ず投稿 
  validates :amounts, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}
  #金額を必ず入力。整数入力で1円以上から
  
  # 引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するか
  def favorited_by?(crrent_user)
    favorites.where(user_id: crrent_user).exists?
  end
  
  # 検索方法について商品で検索する場合、完全一致か部分一致かで検索
  def Product.search(search, how_search, shop_or_product)
    if shop_or_product == "2"
      if how_search == "1"
        Product.where(['product_name LIKE ?', "#{search}"])   #完全一致  
      elsif how_search == "2"
        Product.where(['product_name LIKE ?', "%#{search}%"]) #部分一致  
      else
        Product.all
      end
    end
  end
  
end
