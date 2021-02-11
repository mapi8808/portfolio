class Shop < ApplicationRecord
  # ユーザーテーブルと関連付け
  belongs_to :user
  has_many :product_comments, dependent: :destroy
end
