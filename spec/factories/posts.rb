FactoryBot.define do
  factory :post do
    content { Faker::Lorem.characters(number: 50) }

    after(:build) do |post|
      post.image.attach(
        io: File.open(Rails.root.join('spec/fixtures/test.jpg')),
        filename: 'test.jpg',
        content_type: 'image/jpeg'
      )
    end
  end
end