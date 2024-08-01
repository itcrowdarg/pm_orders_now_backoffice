module Admin
  module BackofficeModule
    class BaseController < AdminController
      #      NOT LIMIT USER KINDS
      #      before_action :allow_user_kind
      #
      #      def allow_user_kind
      #        return if current_user.admin?
      #
      #        raise CanCan::AccessDenied
      #      end
    end
  end
end
