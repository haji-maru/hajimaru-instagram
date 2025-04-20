class Apps::ProfilesController < Apps::ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    @profile.assign_attributes(profile_params)
    if @profile.save
      render json: { status: 'ok', message: '更新できました', avatar_url: url_for(@profile.avatar) }
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