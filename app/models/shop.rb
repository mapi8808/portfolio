class Shop < ApplicationRecord
  # ユーザーテーブルと関連付け
  belongs_to :user
  has_many :products, dependent: :destroy
end
