class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :shop_name
      t.string :url
      t.string :address
      t.string :tel
      t.string :hours
      t.string :holiday
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
