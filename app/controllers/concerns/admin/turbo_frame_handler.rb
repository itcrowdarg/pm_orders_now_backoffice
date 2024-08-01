module Admin
  module TurboFrameHandler
    extend ActiveSupport::Concern

    included do
      helper_method :turbo_frame_id
      helper_method :next_frame_id

      def turbo_frame_id
        request.headers['Turbo-Frame'] || '_top'
      end

      def next_frame_id
        case turbo_frame_id
        when '_top'
          'form-entity'
        when 'form-entity'
          'form-entity-two'
        end
      end
    end
  end
end
