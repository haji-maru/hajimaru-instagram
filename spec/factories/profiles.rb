# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
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
