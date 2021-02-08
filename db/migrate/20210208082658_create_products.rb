class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :image_id
      t.text :body
      t.integer :amounts
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
