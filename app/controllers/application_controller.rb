class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後の遷移先を指定
  def after_sign_in_path_for(resource_or_scope)
    posts_path
  end

  def current_user
    ActiveDecorator::Decorator.instance.decorate(super) if super.present?
    super
  end

  # usernameの登録・更新を許可とする記載
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
