module Admin
  module BackofficeModule
    class MainController < BaseController
      authorize_resource class: :main_admin

      def index; end
    end
  end
end
