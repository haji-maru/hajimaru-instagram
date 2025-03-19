class TimelinesController < ApplicationController
  before_action :authenticate_user!

  def index
    @timelines = Timeline.all
  end

  def show
  end

  def create
  end

  def destroy
  end
end