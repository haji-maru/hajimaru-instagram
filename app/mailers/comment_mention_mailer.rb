class CommentMentionMailer < ApplicationMailer
  def account_name_mention(mention_user, comment)
    @mention_user = mention_user # メンションされた人
    @comment = comment # コメント内容
    @post_url = post_url(@comment.post) # 投稿へのリンクを作成
    mail to: @mention_user.email, subject: '【お知らせ】メンションされました'
  end
end