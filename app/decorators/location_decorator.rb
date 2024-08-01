class LocationDecorator < ApplicationDecorator
  delegate_all

  def is_active_icon
    icon = is_active? ? 'cart-check-fill text-success' : 'cart-x'
    h.content_tag(:i, '', class: "bi bi-#{icon}")
  end

  def is_featured_icon
    icon = is_featured? ? 'star-fill text-warning' : 'star'
    h.content_tag(:i, '', class: "bi bi-#{icon}")
  end

end
