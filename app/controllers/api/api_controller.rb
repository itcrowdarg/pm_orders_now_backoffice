module Api
  class ApiController < ApiApplicationController
    before_action :check_token!
    before_action :authenticate_user!
  end
end
