module Models
  module NormalUsersHelper
    def new_normal_user_button(args = {})
      args[:url_to] ||= new_normal_user_path
      new_button(args) if can?(:create, NormalUser)
    end

    def edit_normal_user_button(normal_user, args = {})
      args[:url_to] ||= edit_normal_user_path(normal_user)
      normal_user.trigger_user = current_user
      args[:disabled] = normal_user.cannot_edit?.to_s
      edit_button(args) if can?(:update, NormalUser)
    end

    def show_normal_user_button(normal_user, args = {})
      args[:url_to] ||= normal_user_path(normal_user)
      show_button(args) if can?(:read, NormalUser)
    end

    def destroy_normal_user_button(normal_user, args = {})
      args[:url_to] ||= normal_user_path(normal_user)
      normal_user.trigger_user = current_user
      args[:disabled] = normal_user.cannot_destroy?.to_s
      destroy_button(args) if can?(:destroy, NormalUser)
    end

    def confirm_normal_user_button(normal_user, args = {})
      args[:url_to] ||= confirm_normal_user_path(normal_user)
      normal_user.trigger_user = current_user
      args[:icon] = 'check2-square'
      args[:name] = t(:confirm, scope: :actions)
      args[:btn_class] = 'btn btn-sm btn-link text-nowrap'
      args[:added_data] = {
        turbo_method: :post,
        turbo_confirm: "#{t(:confirm,
                            scope: :actions)}//#{t(:question,
                                                   scope: %i[messages
                                                             confirm])}//#{t(:confirm, scope: :actions)}//btn-primary"
      }
      args[:disabled] = normal_user.cannot_edit?.to_s
      show_button(args) if can?(:update, NormalUser) && !normal_user.confirmed?
    end

    def send_confirmation_normal_user_button(normal_user, args = {})
      args[:url_to] ||= send_confirmation_normal_user_path(normal_user)
      normal_user.trigger_user = current_user
      args[:icon] = 'send'
      args[:name] = t(:send, scope: :actions)
      args[:btn_class] = 'btn btn-sm btn-link text-nowrap'
      args[:added_data] = {
        turbo_method: :post,
        turbo_confirm: "#{t(:send,
                            scope: :actions)}//#{t(:question,
                                                   scope: %i[messages
                                                             send])}//#{t(:send, scope: :actions)}//btn-primary"
      }
      args[:disabled] = normal_user.cannot_edit?.to_s
      show_button(args) if can?(:update, NormalUser) && !normal_user.confirmed?
    end
  end
end
