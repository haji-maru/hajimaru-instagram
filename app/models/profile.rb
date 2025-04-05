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
class Profile < ApplicationRecord

  belongs_to :user

  has_one_attached :avatar

  def avatar_path
    Rails.application.routes.url_helpers.rails_blob_path(avatar, only_path: true)
  end
end
