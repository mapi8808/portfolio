class Shop < ApplicationRecord
  # ユーザーテーブルと関連付け
  belongs_to :user
  has_many :product, dependent: :destroy
end
