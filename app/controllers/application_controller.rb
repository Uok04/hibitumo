  class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    # before_action :authenticate_user!
  
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar, :nickname, :email, :password, :password_confirmation, :position, :affiliation])
      devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
    end
  end

  