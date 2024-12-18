FactoryBot.define do
  factory :item do
    item_name     { 'サンプル商品' }
    description   { 'これはサンプル商品です。' }
    category      { 'レディース' }
    status        { '新品・未使用' }
    shipping_cost { '送料込み（出品者負担)' }
    prefecture    { '東京都' }
    shipping_date { '1~2日で発送' }
    price         { 500 }
    association :user
  end
end
