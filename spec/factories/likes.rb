# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_likes_on_post_id  (post_id)
#  index_likes_on_user_id  (user_id)
#
FactoryBot.define do
  factory :like do
  end
end
