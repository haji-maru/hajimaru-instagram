# == Schema Information
#
# Table name: timelines
#
#  id         :bigint           not null, primary key
#  content    :text
#  posttime   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_timelines_on_user_id  (user_id)
#
class Timeline < ApplicationRecord
  belongs_to :user

  validates :content, presence: true
  validates :content, length: { minimum: 2, maximum: 100 }

  has_many_attached :images
end
