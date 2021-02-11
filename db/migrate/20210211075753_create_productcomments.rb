class CreateProductcomments < ActiveRecord::Migration[5.2]
  def change
    create_table :productcomments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :shop_id

      t.timestamps
    end
  end
end
