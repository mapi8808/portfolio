class Product < ApplicationRecord
  # ユーザーテーブルと関連付け
  belongs_to :user
  attachment :image
  
end
