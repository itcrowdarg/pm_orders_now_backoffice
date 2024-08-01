class UserDecorator < ApplicationDecorator
  delegate_all

  def timezone_decorate
    timezone.presence || 'UTC'
  end

  def locale_decorate
    locale.present? ? locale.to_sym : I18n.default_locale
  end
end
