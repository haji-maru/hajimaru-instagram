class Api::FollowsController < Api::ApplicationController
  before_action :authenticate_user!

  def show
    user = User.find(params[:account_id])
    follow_status = current_user.has_followed?(user)
    render json: { hasFollowed: follow_status }
  end

  def create
    user = User.find(params[:account_id])
    current_user.follow!(params[:account_id])

    render json: { status: 'ok', follower_count: user.follower_count, following_count: user.following_count }
  end
end