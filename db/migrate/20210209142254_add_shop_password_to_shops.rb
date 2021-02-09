class AddShopPasswordToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :shop_password, :string
  end
end
