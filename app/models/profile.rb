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

  validate :avatar_must_be_image

  def avatar_path
    Rails.application.routes.url_helpers.rails_blob_path(avatar, only_path: true) if avatar.attached?
  end

  private

  def avatar_must_be_image
    return unless avatar.attached?
    if !avatar.content_type.in?(%w[image/jpeg image/png image/gif])
      errors.add(:avatar, 'は画像ファイル（jpeg/png/gif）のみアップロード可能です')
    end
  end
end
