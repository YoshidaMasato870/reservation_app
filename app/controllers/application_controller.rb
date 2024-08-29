class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :user_icon, :introduction])
    devise_parameter_sanitizer.permit(:update, keys: [:name, :user_icon, :introduction])
end

def update_resource(resource, params)
    resource.update_without_password(params)
end

end
