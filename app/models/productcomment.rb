class Productcomment < ApplicationRecord
  belongs_to :user
  # belongs_to :shop
  belongs_to :product
end
