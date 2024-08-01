module Api
  module ExceptionHandler
    extend ActiveSupport::Concern

    included do
      def catch_404
        raise ActionController::RoutingError.new(params[:path])
      end

      rescue_from ActionController::RoutingError do |_exception|
        json_response(message: I18n.t(:route_not_found, scope: 'errors.messages'), status: :not_found)
      end

      rescue_from CanCan::AccessDenied do |_e|
        json_response(message: I18n.t(:access_denied, scope: 'errors.messages'), status: :forbidden)
      end

      rescue_from ActiveRecord::RecordNotFound do |_e|
        json_response(message: I18n.t(:record_not_found, scope: 'errors.messages'), status: :not_found)
      end
    end
  end
end
