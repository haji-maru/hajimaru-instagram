class AccountsController < ApplicationController
  def show
    @user = User.find(params[:id])
    @profile = @user.prepare_profile
    if @user == current_user
      redirect_to profile_path
    end
  end
end