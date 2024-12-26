class CreateShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_addresses do |t|
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :block, null: false
      t.string :token, null: false
      t.integer :item_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :shipping_addresses, :item_id
    add_index :shipping_addresses, :user_id
  end
end
