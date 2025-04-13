class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:account_id])
    current_user.follow!(params[:account_id])

    render json: { status: 'ok', follower_count: user.follower_count, following_count: user.following_count }
  end
end