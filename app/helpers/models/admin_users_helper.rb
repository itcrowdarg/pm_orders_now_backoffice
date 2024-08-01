module Models
  module AdminUsersHelper
    def new_admin_user_button(args = {})
      args[:url_to] ||= new_admin_user_path
      new_button(args) if can?(:create, AdminUser)
    end

    def edit_admin_user_button(admin_user, args = {})
      args[:url_to] ||= edit_admin_user_path(admin_user)
      admin_user.trigger_user = current_user
      args[:disabled] = admin_user.cannot_edit?.to_s
      edit_button(args) if can?(:update, AdminUser)
    end

    def show_admin_user_button(admin_user, args = {})
      args[:url_to] ||= admin_user_path(admin_user)
      show_button(args) if can?(:read, AdminUser)
    end

    def destroy_admin_user_button(admin_user, args = {})
      args[:url_to] ||= admin_user_path(admin_user)
      admin_user.trigger_user = current_user
      args[:disabled] = admin_user.cannot_destroy?.to_s
      destroy_button(args) if can?(:destroy, AdminUser)
    end
  end
end
