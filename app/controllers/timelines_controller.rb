class TimelinesController < ApplicationController
  before_action :authenticate_user!

  def show
    user_ids = current_user.followings.pluck(:id)
    @posts = Post
    .where(user_id: user_ids) # フォローしているユーザーの投稿取得
    .where('posts.created_at >= ?', 24.hours.ago) # 24時間以内に作られた投稿
    .left_joins(:likes) # いいねされてない投稿も含む joins(:likes) いいねされてる投稿のみ
    .group('posts.id') # posts.idをグループ化
    .order('COUNT(likes.id) DESC') # いいね数が多い順に並べる
    .limit(5) # 上位5件を取得
  end
end