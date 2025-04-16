# frozen_string_literal: true

module UserDecorator
  # ユーザーのアバター画像がなければデフォルトを使用
  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'default-avatar.png'
    end
  end
end
