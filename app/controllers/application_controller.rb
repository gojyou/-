class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
   protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:genre])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:area])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:station])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:url])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:phrase])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:image])
    end

    def after_sign_in_path_for(resource)
     admin_store_path(current_admin_store)
    end
end
