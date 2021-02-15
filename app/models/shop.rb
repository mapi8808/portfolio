class Shop < ApplicationRecord
  # ユーザーテーブルと関連付け
  belongs_to :user
  
end
