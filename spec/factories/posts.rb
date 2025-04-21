FactoryBot.define do
  factory :post do
    content { Faker::Lorem.characters(number: 50) }
  end
end