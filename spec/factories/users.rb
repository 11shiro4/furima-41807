FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { last_name }
    first_name            { first_name }
    last_name_kana        { last_name_kana }
    first_name_kana       { first_name_kana }
    birthday              { birthday }
  end
end
