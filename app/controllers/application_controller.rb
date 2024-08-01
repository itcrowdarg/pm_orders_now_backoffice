class ApplicationController < ActionController::Base
  include Admin::ExceptionHandler
  include Admin::LocaleHandler
  include Admin::TimezoneHandler
  include Admin::TurboFrameHandler

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name timezone locale])
  end
end
