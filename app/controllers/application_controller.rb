class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_customers_path         
    when Customer
      customers_path              
    end
  end
  
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin_admin_user
      root_path
    else
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana,  :first_name_kana, :manaba_user_id, :manaba_password, :line_path, :email])
  end
end
