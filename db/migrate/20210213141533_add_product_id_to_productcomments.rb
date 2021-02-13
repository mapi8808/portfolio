class AddProductIdToProductcomments < ActiveRecord::Migration[5.2]
  def change
    add_column :productcomments, :product_id, :interger
  end
end
