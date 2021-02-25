class Shop < ApplicationRecord
  # ユーザーテーブルと関連付け
  belongs_to :user
  has_many :products, dependent: :destroy
  
  validates :shop_name, length:  { in: 1..20 }, presence: true
  validates :address, presence: true
  validates :tel, length: { minimum: 10 },  presence: true
  validates :hours, presence: true
  validates :admin_email, presence: true
  validates :shop_name, length:  { in: 1..20 }, presence: true
  
  # 検索で店舗を選んだ時、完全一致か部分一致で検索可能
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
