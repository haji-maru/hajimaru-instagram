class FollowingsController < ApplicationController
  before_action :authenticate_user!

  def show
    user = User.find(params[:account_id])
    @followings = user.followings
  end
end