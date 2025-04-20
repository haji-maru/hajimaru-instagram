class Api::UnfollowsController < Api::ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:account_id])
    current_user.unfollow!(params[:account_id])

    render json: { status: 'ok', follower_count: user.follower_count, following_count: user.following_count }
  end
end