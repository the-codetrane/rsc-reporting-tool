class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception, prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :logged_in_user
  before_action :set_admin


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :group_id, :committee_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :password, :group_id, :committee_id])
  end

  private

  def logged_in_user
    @logged_in ||= current_user
  end

  def set_admin
    if @logged_in && @admin.nil?
      @logged_in.role.name == 'Admin' ? @admin = true : @admin = false
    end
  end

end

