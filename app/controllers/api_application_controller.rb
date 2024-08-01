class ApiApplicationController < ActionController::API
  include Api::ExceptionHandler
  include Api::ApiAuthentication
  include Api::LocaleHandler
  include Api::TimezoneHandler
  include Api::ApiResponse
end
