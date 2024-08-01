module Api
  module ApiAuthentication
    extend ActiveSupport::Concern

    included do
      helper_method :current_user

      def current_user
        @current_user
      end

      def current_token
        @current_token
      end

      def check_token!
        access_token = request.headers['access-token']

        return unless access_token.present?

        access_token_decoded = JsonWebToken.decode(access_token)
        @current_token = NormalUserToken.find_by(id: access_token_decoded[:token_id])
      end

      def authenticate_user!
        if current_token.present?
          if current_token.active?
            @current_user = current_token.normal_user
          else
            json_response(message: I18n.t(:token_expired, scope: 'errors.messages'), status: :forbidden)
          end
        else
          json_response(message: I18n.t(:access_denied, scope: 'errors.messages'), status: :forbidden)
        end
      end
    end
  end
end
