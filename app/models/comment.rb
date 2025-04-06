# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_post_id  (post_id)
#  index_comments_on_user_id  (user_id)
#
class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :content, presence: true

  private

  def check_mentions
    # メンションされたユーザーの検出
    mentioned_usernames = @comment.content.scan(/@(\w+)/).flatten
    # メンションされたユーザーの取得
    mentioned_users = User.where(username: mentioned_usernames)
    # 通知メールの送信
    mentioned_users.each do |mention_user|
      CommentMentionMailer.account_name_mention(mention_user, @comment).deliver_later
    end
  end
end
