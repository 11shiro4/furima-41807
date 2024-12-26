FactoryBot.define do
  factory :shipping_address do
    prefecture_id { 1 }
    city { "MyString" }
    block { "MyString" }
    token { "MyString" }
    item_id { 1 }
    user_id { 1 }
  end
end
