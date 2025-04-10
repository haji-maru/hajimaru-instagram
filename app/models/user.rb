# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { minimum: 2, maximum: 20 }

  has_one :profile, dependent: :destroy

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  # フォローできるようにする
  has_many :following_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  # following取得
  has_many :followings, through: :following_relationships, source: :following

  # フォロワーの関係性
  has_many :follower_relationships, foreign_key: 'following_id', class_name: 'Relationship', dependent: :destroy
  # follower取得
  has_many :followers, through: :follower_relationships, source: :follower

  # プロフィールが存在すればそれを返し、なければ新しく作成する
  def prepare_profile
    profile || build_profile
  end

  # 「いいね」しているかを判定する
  def has_liked?(post)
    likes.exists?(post_id: post.id)
  end

  # ユーザーのアバター画像がなければデフォルトを使用
  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'default-avatar.png'
    end
  end

  # フォローする
  def follow!(user)
    following_relationships.create!(following_id: user.id)
  end
end
