module Models
  module UsersHelper
    def user_locale_options(entity)
      options = I18n.available_locales
      options_for_select(options, entity.locale)
    end

    def user_timezone_options(entity)
      options = User::TIMEZONES
      options_for_select(options, entity.timezone)
    end
  end
end
