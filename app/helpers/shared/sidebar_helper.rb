module Shared
  module SidebarHelper
    def nav_link_active_class(item)
      case item
      when :root
        controller_name == 'main' && action_name == 'index' ? 'active' : ''
      when :admin_users
        controller_name == 'admin_users' ? 'active' : ''
      when :normal_users
        controller_name == 'normal_users' ? 'active' : ''
      end
    end
  end
end
