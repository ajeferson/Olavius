class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  # Cancancan stuff

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to user_root_path, alert: exception.message
  end

  def user_root_path
    home_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  def root
    redirect_to new_user_session_path
  end

end
