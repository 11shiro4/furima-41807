class AddDetailsToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :postcode, :string
    add_column :orders, :prefecture_id, :integer
    add_column :orders, :city, :string
    add_column :orders, :block, :string
    add_column :orders, :building, :string
    add_column :orders, :phone_number, :string
  end
end
