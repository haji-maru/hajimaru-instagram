class FollowersController < ApplicationController
  before_action :authenticate_user!

  def show
    user = User.find(params[:account_id])
    @followers = user.followers
  end
end