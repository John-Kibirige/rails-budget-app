class ApplicationController < ActionController::Base
    before_action :authenticate_user!

     protect_from_forgery with: :exception
    before_action :update_allowed_parameters, if: :devise_controller?

  # Catch all CanCan errors and alert the user of the exception
#   rescue_from CanCan::AccessDenied do |exception|
#     redirect_to inventories_url, alert: exception.message
#   end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password)
    end
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path
  end
end
