module Api
  module TimezoneHandler
    extend ActiveSupport::Concern

    included do
      around_action :set_timezone

      def set_timezone(&block)
        time_zone = if current_user.present?
                      current_user.decorate.timezone_decorate
                    else
                      'UTC'
                    end
        Time.use_zone(time_zone, &block)
      end
    end
  end
end
