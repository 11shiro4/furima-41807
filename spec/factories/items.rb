FactoryBot.define do
  factory :item do
    item_name     { 'サンプル商品' }
    description   { 'これはサンプル商品です。' }
    category_id   { Category.first.id }
    status_id     { Status.first.id }
    shipping_cost_id { ShippingCost.first.id }
    prefecture_id { Prefecture.first.id }
    shipping_date_id { ShippingDate.first.id }
    price         { 500 }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
