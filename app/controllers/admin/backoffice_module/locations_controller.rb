module Admin
  module BackofficeModule
    class LocationsController < BaseController
      authorize_resource
      before_action :set_location, only: %i[show edit update destroy]

      # GET /locations
      def index
        @presenter = LocationsPresenter.new(params:, session:, current_user:)
        respond_to do |format|
          format.html
          format.turbo_stream
          format.json do
            array_list = @presenter.list.map do |item|
              { id: item.id, text: item.to_s }
            end
            render json: { results: array_list, pagination: { more: @presenter.list.next_page.present? } }
          end
        end
      end

      # GET /locations/1
      def show
        @location = @location.decorate
      end

      # GET /locations/new
      def new
        location_manager = LocationManager.new(params:, current_user:)
        @location = location_manager.build
      end

      # GET /locations/1/edit
      def edit; end

      # POST /locations
      def create
        location_manager = LocationManager.new(params:, current_user:)

        if location_manager.create
          @location = location_manager.object.decorate
          flash.now[:notice] = t(:success, scope: %i[messages create])
        else
          @location = location_manager.object
          flash.now[:error] = location_manager.error_message

          render :new, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /locations/1
      def update
        location_manager = LocationManager.new(params:, current_user:, object: @location)

        if location_manager.update
          @location = location_manager.object.decorate
          flash.now[:notice] = t(:success, scope: %i[messages update])
        else
          @location = location_manager.object
          flash.now[:error] = location_manager.error_message

          render :edit, status: :unprocessable_entity
        end
      end

      # DELETE /locations/1
      def destroy
        location_manager = LocationManager.new(current_user:, object: @location)
        @location = location_manager.object

        if location_manager.destroy
          flash.now[:notice] = t(:success, scope: %i[messages destroy])
        else
          flash.now[:error] = location_manager.error_message
          render :refresh_flash_messages, status: :unprocessable_entity
        end
      end

      private

      def set_location
        @location ||= Location.find(params[:id])
      end
    end
  end
end
