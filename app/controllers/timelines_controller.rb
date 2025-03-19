class TimelinesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_timeline, only: [:index, :new]

  def index
    @timelines = Timeline.all
  end

  def show
  end

  def new
    @timeline = current_user.timelines.build
  end

  def create
    @timeline = current_user.timelines.build(timeline_params)
    if @timeline.save
      redirect_to timelines_path, notice: '保存できました'
    else
      flash.now[:error] = '保存に失敗しました'
    end
  end

  def destroy
  end

  private

  def timeline_params
    params.require(:timeline).permit(:content, :images)
  end

  def set_timeline
    @profile = current_user.prepare_profile
    @user = current_user
  end
end