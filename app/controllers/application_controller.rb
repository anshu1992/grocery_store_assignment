class ApplicationController < ActionController::Base
  include ApplicationHelper

  before_action :authenticate_user!
  before_action :redirect_admin_to_dashboard
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :first_name, :last_name, :phone_number, :birthdate, :address, :city, :state, :zip_code])
    devise_parameter_sanitizer.permit(:account_update, keys: [:password, :first_name, :last_name, :phone_number, :birthdate, :address, :city, :state, :zip_code])
  end

  def redirect_admin_to_dashboard
    if current_admin_user.present?
      redirect_to admin_dashboard_path
    end
  end
end
