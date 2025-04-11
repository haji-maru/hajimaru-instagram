class AccountsController < ApplicationController
  def show
    @user = User.find(params[:id])
    @profile = @user.prepare_profile
  end
end