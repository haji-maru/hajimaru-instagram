# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
class Post < ApplicationRecord
  belongs_to :user

  validates :content, presence: true
  validates :content, length: { minimum: 2, maximum: 100 }

  has_many_attached :images

  has_many :likes, dependent: :destroy
end
