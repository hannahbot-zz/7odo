class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # before_filter :configure_permitted_parameters, if: :devise_controller?

  before_filter :configure_permitted_parameters, if: :devise_controller?

  http_basic_authenticate_with name: "user", password: "password"

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :username) }
    end

  private

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

end
