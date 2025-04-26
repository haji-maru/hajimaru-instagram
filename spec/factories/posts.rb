FactoryBot.define do
  factory :post do
    content { Faker::Lorem.characters(number: 50) }

    trait :with_images do
      after(:build) do |post|
        post.images.attach(
          io: File.open(Rails.root.join('app/assets/images/back-icon.png')),
          filename: 'back-icon.png',
          content_type: 'image/png'
        )
      end
    end
  end
end