module Shared
  module BreadcrumbHelper
    def breadcrumb_road
      breadcrumbs = []

      case controller_name
      when 'main'
        case action_name
        when 'index'
          breadcrumbs << [t(:home)]
        end
      when 'admin_users'
        breadcrumbs << [AdminUser.model_name.human(count: 2)]
      when 'registrations'
        breadcrumbs << [t(:edit_profile)]
      end

      breadcrumbs
    end
  end
end
