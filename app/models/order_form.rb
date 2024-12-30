class OrderForm
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :token, :item_id, :user_id

  with_options presence: true do
    validates :postcode
    validates :postcode, format: { with: /\A\d{3}-\d{4}\z/, message: 'は「123-4567」の形式で入力してください' }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁以上11桁以内の半角数値で入力してください' }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :block
    validates :token
    validates :item_id
    validates :user_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
  end

  def shipping_attributes
    {
      postcode: postcode,
      prefecture_id: prefecture_id,
      city: city,
      block: block,
      building: building,
      phone_number: phone_number
      # order_id: order.id
    }
  end
end
