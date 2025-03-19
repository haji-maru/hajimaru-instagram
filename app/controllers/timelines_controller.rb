class TimelinesController < ApplicationController
  before_action :authenticate_user!

  def index
    @timelines = Timeline.all
    @profile = current_user.prepare_profile
    @user = current_user
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end
end