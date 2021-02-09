class AddAdminEmailToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :admin_email, :string
  end
end
