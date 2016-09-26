class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
    
  layout :layout_by_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.home_path, :alert => exception.message
  end

  protected
  
  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == "edit"
      'application'
    end
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name, :email])
  end
  
end
