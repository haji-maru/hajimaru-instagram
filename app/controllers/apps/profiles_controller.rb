class Apps::ProfilesController < Apps::ApplicationController
  before_action :set_profile, only: [:show, :update]

  def show
  end


  def update
    @profile.assign_attributes(profile_params)
    if @profile.save
      render json: { status: 'ok', message: '更新できました', avatar_url: url_for(@profile.avatar) }
    else
      render json: { status: 'error', message: '更新できませんでした', errors: @profile.errors.full_messages }, status: :unprocessable_entity
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