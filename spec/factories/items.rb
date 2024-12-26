FactoryBot.define do
  factory :item do
    item_name     { 'サンプル商品' }
    description   { 'これはサンプル商品です。' }
    category_id   { 2 }
    status_id     { 2 }
    shipping_cost_id { 2 }
    prefecture_id { 2 }
    shipping_date_id { 2 }
    price { 500 }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
