module Admin
  module BackofficeModule
    class AdminUsersController < BaseController
      authorize_resource
      before_action :set_admin_user, only: %i[show edit update destroy]

      # GET /admin_users
      def index
        @presenter = AdminUsersPresenter.new(params:, session:, current_user:)
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

      # GET /admin_users/1
      def show
        @admin_user = @admin_user.decorate
      end

      # GET /admin_users/new
      def new
        admin_user_manager = AdminUserManager.new(params:, current_user:)
        @admin_user = admin_user_manager.build
      end

      # GET /admin_users/1/edit
      def edit; end

      # POST /admin_users
      def create
        admin_user_manager = AdminUserManager.new(params:, current_user:)

        if admin_user_manager.create
          @admin_user = admin_user_manager.object.decorate
          flash.now[:notice] = t(:success, scope: %i[messages create])
        else
          @admin_user = admin_user_manager.object
          flash.now[:error] = admin_user_manager.error_message

          render :new, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /admin_users/1
      def update
        admin_user_manager = AdminUserManager.new(params:, current_user:, object: @admin_user)

        if admin_user_manager.update
          @admin_user = admin_user_manager.object.decorate
          flash.now[:notice] = t(:success, scope: %i[messages update])
        else
          @admin_user = admin_user_manager.object
          flash.now[:error] = admin_user_manager.error_message

          render :edit, status: :unprocessable_entity
        end
      end

      # DELETE /admin_users/1
      def destroy
        admin_user_manager = AdminUserManager.new(current_user:, object: @admin_user)
        @admin_user = admin_user_manager.object

        if admin_user_manager.destroy
          flash.now[:notice] = t(:success, scope: %i[messages destroy])
        else
          flash.now[:error] = admin_user_manager.error_message
          render :refresh_flash_messages, status: :unprocessable_entity
        end
      end

      private

      def set_admin_user
        @admin_user ||= AdminUser.find(params[:id])
      end
    end
  end
end
