class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    @profile.assign_attributes(profile_params)
    if @profile.save
      redirect_to profile_path, notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  private

  def set_profile
    @profile = current_user.prepare_profile
  end

  def profile_params
    params.require(:profile).permit(:avatar)
  end
end