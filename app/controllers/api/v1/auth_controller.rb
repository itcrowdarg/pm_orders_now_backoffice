module Api
  module V1
    class AuthController < ApiController
      skip_before_action :check_token!
      skip_before_action :authenticate_user!

      # POST /auth/sign_in
      def sign_in
        normal_user = NormalUser.find_by!(email: params[:email])

        if normal_user.valid_password?(params[:password])
          if normal_user.confirmed?
            current_normal_user_token = NormalUserToken.generate(normal_user:)
            json_response(
              data: current_normal_user_token.as_json
            )
          else
            json_response(
              message: I18n.t(:need_confirmation, scope: 'errors.messages'),
              errors: normal_user.errors,
              status: :forbidden
            )
          end
        else
          json_response(
            message: I18n.t(:access_denied, scope: 'errors.messages'),
            errors: normal_user.errors,
            status: :unauthorized
          )
        end
      end

      # POST /auth/refresh_token
      def refresh_token
        current_normal_user_token = NormalUserToken.find_by(access_token: params[:access_token],
                                                            refresh_token: params[:refresh_token])

        raise ActiveRecord::RecordNotFound unless current_normal_user_token.present?

        current_normal_user_token = current_normal_user_token.refresh
        json_response(
          data: current_normal_user_token.as_json
        )
      end

      # POST /auth/sign_up
      # TODO: change NormalUser.new to NormalUserManager.new
      def sign_up
        normal_user = NormalUser.new(
          first_name: params[:first_name],
          last_name: params[:last_name],
          email: params[:email],
          password: params[:password],
          password_confirmation: params[:password_confirmation]
        )

        if normal_user.save_and_log
          json_response(
            data: normal_user.as_json
          )
        else
          json_response(
            message: I18n.t(:error, scope: %i[messages create]),
            data: normal_user.as_json,
            errors: normal_user.errors,
            status: :unprocessable_entity
          )
        end
      end

      # POST /auth/send_confirmation
      def send_confirmation
        normal_user = NormalUser.find_by!(email: params[:email])

        if !normal_user.confirmed?
          normal_user.resend_confirmation_instructions
          json_response(
            data: normal_user.as_json
          )
        else
          json_response(
            message: I18n.t(:already_confirmed, scope: 'errors.messages'),
            data: normal_user.as_json,
            errors: normal_user.errors,
            status: :forbidden
          )
        end
      end

      # GET /auth/confirm
      def confirm
        normal_user = NormalUser.find_by(confirmation_token: params[:confirmation_token])

        if normal_user.present?
          if !normal_user.confirmed?
            normal_user.confirm
            if mobile_device == 'desktop'
              redirect_to confirmed_path
            else
              redirect_to 'ordersnow://confirmed'
            end
          elsif mobile_device == 'desktop'
            redirect_to already_confirmed_path
          else
            redirect_to 'ordersnow://already_confirmed'
          end
        elsif mobile_device == 'desktop'
          redirect_to user_not_found_path
        else
          redirect_to 'ordersnow://user_not_found'
        end
      end

      # POST /auth/send_reset_password
      def send_reset_password
        normal_user = NormalUser.find_by!(email: params[:email])
        normal_user.send_reset_password_instructions
        json_response(
          data: { email: normal_user.email }.as_json
        )
      end

      # GET /auth/reset_password
      def reset_password
        normal_user = NormalUser.with_reset_password_token(params[:reset_password_token])
        if normal_user.present?
          if mobile_device == 'desktop'
            redirect_to reset_password_path
          else
            redirect_to "ordersnow://reset_password/#{params[:reset_password_token]}"
          end
        elsif mobile_device == 'desktop'
          redirect_to user_not_found_path
        else
          redirect_to 'ordersnow://user_not_found'
        end
      end

      # PUT /auth/reset_password
      def reset_password_update
        normal_user = NormalUser.with_reset_password_token(params[:reset_password_token])
        raise ActiveRecord::RecordNotFound unless normal_user.present?

        if normal_user.reset_password(params[:password], params[:password_confirmation])
          json_response(
            data: normal_user.as_json
          )
        else
          json_response(
            message: I18n.t(:error, scope: %i[messages update]),
            data: normal_user.as_json,
            errors: normal_user.errors,
            status: :unprocessable_entity
          )
        end
      end

      private

      def mobile_device
        agent = request.user_agent
        return 'tablet' if agent =~ /(tablet|ipad)|(android(?!.*mobile))/i
        return 'mobile' if agent =~ /Mobile/

        'desktop'
      end
    end
  end
end
