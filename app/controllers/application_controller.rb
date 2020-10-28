class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    posts_show_path
  end

  private

  def sign_in_required
    redirect_to new_user_session_url unless user_signed_in?
  end

  def logged_in_user
    unless user_signed_in?
      store_location
      flash[:danger] = "ログインしてください"
      redirect_to sign_in_url
    end
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :introduce, :profile_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
