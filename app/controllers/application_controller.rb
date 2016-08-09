class ApplicationController < ActionController::Base
  include PublicActivity::StoreController

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?


  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :profile_picture, :first_name, :last_name, :email, :password, :password_confimation])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :profile_picture, :first_name, :last_name, :email, :password, :password_confimation])
    end

end
