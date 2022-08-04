class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
 
  before_action :update_allowed_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
  private
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to splash_path if request.original_fullpath != splash_path
    end
  end
end
