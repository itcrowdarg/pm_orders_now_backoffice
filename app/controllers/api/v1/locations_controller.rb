module Api
  module V1
    class LocationsController < ApiController
      wrap_parameters include: (Location.attribute_names + [:images_attributes])
      before_action :set_location, only: %i[show update]

      # GET /locations
      def index
        presenter = LocationsPresenter.new(params:, session:, current_user:)

        if presenter.filter.valid?
          items = presenter.list(decorate: false).map{|i| i.as_json(args: as_json_args_simple, current_user: current_user)}
          hash = {}
          hash[:pagination] = presenter.pagination_info_data
          hash[:items] = items
          json_response(
            data: hash
          )
        else
          json_response(
              message: I18n.t(:invalid, scope: 'errors.messages'),
              errors: presenter.filter.errors,
              status: :unprocessable_entity
          )
        end
      end

      # GET /locations/1
      def show
        json_response(
          data: @location.as_json(args: as_json_args_complete, current_user: current_user)
        )
      end

      # POST /locations
      def create
        location_manager = LocationManager.new(params: params, current_user: current_user, source: :api)

        if location_manager.create
          json_response(
            data: location_manager.object.as_json(args: as_json_args_complete, current_user: current_user)
          )
        else
          json_response(
            message: I18n.t(:error, scope: %i[messages create]),
            data: location_manager.object.as_json(args: as_json_args_complete, current_user: current_user),
            errors: location_manager.object.errors,
            status: :unprocessable_entity
          )
        end
      end

      # PUT /locations/[id]
      def update
        location_manager = LocationManager.new(params: params, object: @location, current_user: current_user, source: :api)

        if location_manager.update
          json_response(
            message: I18n.t(:success, scope: %i[messages update]),
            data: location_manager.object.as_json(args: as_json_args_complete, current_user: current_user),
            status: :ok
          )
        else
          json_response(
            message: I18n.t(:error, scope: %i[messages update]),
            data: location_manager.object.as_json(args: as_json_args_complete, current_user: current_user),
            errors: normal_publication_manager.object.errors,
            status: :unprocessable_entity
          )
        end
      end

      private

      def set_location
        @location ||= Location.find(params[:id])
      end

      # For listings
      def as_json_args_simple
        {
          veteran: true,
          program: {
            organization: true
          }
        }
      end

      # For single
      def as_json_args_complete
        {
          images: true,
          product_categories: true,
          products: {
            images: true
          }
        }
      end
    end
  end
end
