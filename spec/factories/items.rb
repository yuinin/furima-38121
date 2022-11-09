FactoryBot.define do
  factory :item do
    product_name              { Faker::Base.regexify("[1aあ]{40}") }
    explanation               { Faker::Lorem.sentence }
    category_id               { Faker::Number.between(from: 2, to: 11) }
    condition_id              { Faker::Number.between(from: 2, to: 7) }
    shipping_cost_id          { Faker::Number.between(from: 2, to: 3) }
    from_id                   { Faker::Number.between(from: 2, to: 48) }
    send_id                   { Faker::Number.between(from: 2, to: 4) }
    price                     { Faker::Number.between(from: 300, to: 9999999) }
    user_id                   { 1 }
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
