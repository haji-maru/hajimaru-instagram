class TimelinesController < ApplicationController
  before_action :authenticate_user!

  def show
    user_ids = current_user.followings.pluck(:id)
    time = (Time.zone.now - time) < 24.hours
    @posts = Post.joins(:likes).group(user_ids).order(time).limit(5)
  end
end