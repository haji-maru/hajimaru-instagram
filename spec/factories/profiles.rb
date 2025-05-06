FactoryBot.define do
  factory :profile do

    trait :with_avatar do
      after(:build) do |profile|
        profile.avatar.attach(
          io: File.open(Rails.root.join('app/assets/images/back-icon.png')),
          filename: 'back-icon.png',
          content_type: 'image/png'
        )
      end
    end
  end
end