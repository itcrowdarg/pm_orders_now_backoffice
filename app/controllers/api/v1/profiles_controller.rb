module Api
  module V1
    class ProfilesController < ApiController
      wrap_parameters :normal_user

      # GET /api/v1/profile
      def show
        json_response(
          data: current_user.as_json(args: as_json_args_complete, current_user:)
        )
      end

      # PUT/PATCH /api/v1/profile
      def update
        profile_manager = ProfileManager.new(object: current_user, params:, current_user:,
                                             source: :api)

        if profile_manager.update
          json_response(
            data: profile_manager.object.as_json(args: as_json_args_complete, current_user:)
          )
        else
          json_response(
            message: I18n.t(:error, scope: %i[messages update]),
            data: profile_manager.object.as_json(args: as_json_args_complete, current_user:),
            errors: profile_manager.object.errors,
            status: :unprocessable_entity
          )
        end
      end

      # DELETE /api/v1/profile
      def destroy
        if current_user.destroy
          json_response(
            message: I18n.t(:success, scope: %i[messages destroy])
          )
        else
          json_response(
            message: I18n.t(:error, scope: %i[messages destroy]),
            errors: current_user.errors,
            status: :unprocessable_entity
          )
        end
      end

      private

      # For listings
      def as_json_args_simple
        {}
      end

      # For single
      def as_json_args_complete
        {}
      end
    end
  end
end
