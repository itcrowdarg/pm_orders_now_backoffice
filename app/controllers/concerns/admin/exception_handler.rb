module Admin
  module ExceptionHandler
    extend ActiveSupport::Concern

    included do
      def catch_404
        raise ActionController::RoutingError.new(params[:path])
      end

      rescue_from ActionController::RoutingError do |_exception|
        flash[:error] = t(:route_not_found, scope: 'errors.messages')
        redirect_to root_path
      end

      rescue_from CanCan::AccessDenied do |_exception|
        flash[:error] = t(:access_denied, scope: 'errors.messages')
        redirect_to root_path
      end

      rescue_from ActiveRecord::RecordNotFound do |_exception|
        flash[:error] = t(:record_not_found, scope: 'errors.messages')
        redirect_to root_path
      end

      rescue_from ActionController::UnknownFormat do |_exception|
        flash[:error] = t(:unknown_format, scope: 'errors.messages')
        redirect_to root_path
      end
    end
  end
end
