module Public
  module PublicModule
    class MainController < BaseController
      layout 'main_public'

      def confirmed; end
      def already_confirmed; end
      def user_not_found; end
      def reset_password; end
    end
  end
end
