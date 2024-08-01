module Admin
  module BackofficeModule
    class NormalUsersController < BaseController
      authorize_resource
      before_action :set_normal_user, only: %i[show edit update destroy confirm send_confirmation]

      # GET /normal_users
      def index
        @presenter = NormalUsersPresenter.new(params:, session:, current_user:)
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

      # GET /normal_users/1
      def show
        @normal_user = @normal_user.decorate
      end

      # GET /normal_users/new
      def new
        normal_user_manager = NormalUserManager.new(params:, current_user:)
        @normal_user = normal_user_manager.build
      end

      # GET /normal_users/1/edit
      def edit; end

      # POST /normal_users
      def create
        normal_user_manager = NormalUserManager.new(params:, current_user:)

        if normal_user_manager.create
          @normal_user = normal_user_manager.object.decorate
          flash.now[:notice] = t(:success, scope: %i[messages create])
        else
          @normal_user = normal_user_manager.object
          flash.now[:error] = normal_user_manager.error_message

          render :new, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /normal_users/1
      def update
        normal_user_manager = NormalUserManager.new(params:, current_user:, object: @normal_user)

        if normal_user_manager.update
          @normal_user = normal_user_manager.object.decorate
          flash.now[:notice] = t(:success, scope: %i[messages update])
        else
          @normal_user = normal_user_manager.object
          flash.now[:error] = normal_user_manager.error_message

          render :edit, status: :unprocessable_entity
        end
      end

      # DELETE /normal_users/1
      def destroy
        normal_user_manager = NormalUserManager.new(current_user:, object: @normal_user)
        @normal_user = normal_user_manager.object

        if normal_user_manager.destroy
          flash.now[:notice] = t(:success, scope: %i[messages destroy])
        else
          flash.now[:error] = normal_user_manager.error_message
          render :refresh_flash_messages, status: :unprocessable_entity
        end
      end

      # POST /normal_users/:id/confirm
      def confirm
        normal_user_manager = NormalUserManager.new(current_user:, object: @normal_user)
        @normal_user = normal_user_manager.object

        if normal_user_manager.confirm
          @normal_user = normal_user_manager.object.decorate
          flash.now[:notice] = I18n.t(:success, scope: %i[messages confirm])
        else
          @normal_user = normal_user_manager.object.decorate
          flash.now[:error] = normal_user_manager.error_message
          render :refresh_flash_messages, status: :unprocessable_entity
        end
      end

      # POST /normal_users/:id/send_confirmation
      def send_confirmation
        normal_user_manager = NormalUserManager.new(current_user:, object: @normal_user)
        @normal_user = normal_user_manager.object

        if normal_user_manager.send_confirmation
          @normal_user = normal_user_manager.object.decorate
          flash.now[:notice] = I18n.t(:success, scope: %i[messages send])
        else
          @normal_user = normal_user_manager.object.decorate
          flash.now[:error] = normal_user_manager.error_message
          render :refresh_flash_messages, status: :unprocessable_entity
        end
      end

      private

      def set_normal_user
        @normal_user ||= NormalUser.find(params[:id])
      end
    end
  end
end
