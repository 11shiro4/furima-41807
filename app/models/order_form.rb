class OrderForm
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :token, :item_id, :user_id

  # バリデーションの設定
  validates :postcode, :prefecture_id, :city, :block, :phone_number, :token, presence: true
  validates :postcode, format: { with: /\A\d{3}-\d{4}\z/, message: 'は「123-4567」の形式で入力してください' }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁以上11桁以内の数字で入力してください' }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building,
                           phone_number: phone_number, order_id: order.id)
  end
end
