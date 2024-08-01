module Models
  module LocationsHelper
    def new_location_button(args = {})
      args[:url_to] ||= new_location_path
      new_button(args) if can?(:create, Location)
    end

    def edit_location_button(location, args = {})
      args[:url_to] ||= edit_location_path(location)
      location.trigger_user = current_user
      args[:disabled] = location.cannot_edit?.to_s
      edit_button(args) if can?(:update, Location)
    end

    def show_location_button(location, args = {})
      args[:url_to] ||= location_path(location)
      show_button(args) if can?(:read, Location)
    end

    def destroy_location_button(location, args = {})
      args[:url_to] ||= location_path(location)
      location.trigger_user = current_user
      args[:disabled] = location.cannot_destroy?.to_s
      destroy_button(args) if can?(:destroy, Location)
    end
  end
end
