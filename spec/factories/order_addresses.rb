FactoryBot.define do
  factory :order_address do
    postal_code             { '000-0000' }
    prefecture              { Faker::Number.between(from: 2, to: 48) }
    city                    { Gimei.city.kanji }
    house_number            { Faker::Address.street_address }
    building_name           { '東京ハイツ' }
    phone_number            { Faker::Number.number(digits: 10) }
    token                   {"tok_abcdefghijk00000000000000000"}

  end
end

