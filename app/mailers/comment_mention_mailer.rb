class CommentMentionMailer < ApplicationMailer
  def account_name_mention(user)
    @user = user
    mail to: '@user.email', subject: '【お知らせ】メンションされました'
  end
end