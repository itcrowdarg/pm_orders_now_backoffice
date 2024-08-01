module Admin
  module LocaleHandler
    extend ActiveSupport::Concern

    included do
      before_action :set_locale

      def set_locale
        locale = if current_user.present?
                   current_user.decorate.locale_decorate
                 else
                   I18n.default_locale
                 end

        return unless I18n.available_locales.include?(locale)

        I18n.locale = locale
      end
    end
  end
end
