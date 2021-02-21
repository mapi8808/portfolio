class Shop < ApplicationRecord
  # ユーザーテーブルと関連付け
  belongs_to :user
  has_many :products, dependent: :destroy
  
  def Shop.search(search, how_search, shop_or_product)
    if shop_or_product == "1"
      if how_search == "1"
        Shop.where(['shop_name LIKE ?', "#{search}"])
      elsif how_search == "2"
        Shop.where(['shop_name LIKE ?', "%#{search}%"])
      else
        Shop.all
      end
    end
  end
  
end
