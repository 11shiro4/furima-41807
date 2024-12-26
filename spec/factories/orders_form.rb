FactoryBot.define do
  factory :order_form do
    user_id { 1 }
    item_id { 1 }
    postcode { '123-4567' }
    prefecture_id { 2 }
    city { '渋谷区' }
    block { '1-1-1' }
    building { 'テストビル' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
