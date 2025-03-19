class TimelinesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_timeline, only: [:index, :new]

  def index
    @timelines = Timeline.all
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end

  private

  def set_timeline
    @profile = current_user.prepare_profile
    @user = current_user
  end
end