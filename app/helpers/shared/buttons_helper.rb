module Shared
  module ButtonsHelper
    #------------------------------ Custom new button
    def new_button(args = {})
      # Assigns args
      url_to,
      icon,
      name,
      btn_class,
      hide_name,
      hide_icon,
      disabled,
      added_data = get_button_parameters(args)

      # Defaults
      url_to ||= []
      icon ||= :plus
      name ||= t(:new, scope: :actions)
      btn_class ||= 'btn btn-lg btn-primary text-nowrap flex-grow-1'
      hide_name ||= 'false'
      hide_icon ||= 'false'
      disabled ||= 'false'
      added_data ||= { 'turbo-frame': 'form-entity' }

      link_to(
        print_icon_and_name((hide_icon.to_boolean ? nil : icon), (hide_name.to_boolean ? nil : name), false),
        url_to,
        data: added_data,
        class: "#{btn_class}",
        title: name,
        disabled: disabled.to_boolean
      )
    end

    #------------------------------ Custom edit button
    def edit_button(args = {})
      # Assigns args
      url_to,
      icon,
      name,
      btn_class,
      hide_name,
      hide_icon,
      disabled,
      added_data = get_button_parameters(args)

      # Defaults
      url_to ||= []
      icon ||= :pencil
      name ||= t(:edit, scope: :actions)
      btn_class ||= 'btn btn-sm btn-link text-nowrap'
      hide_name ||= 'true'
      hide_icon ||= 'false'
      disabled ||= 'false'
      added_data ||= { 'turbo-frame': 'form-entity' }

      link_to(
        print_icon_and_name((hide_icon.to_boolean ? nil : icon), (hide_name.to_boolean ? nil : name)),
        url_to,
        data: added_data,
        class: "#{btn_class}",
        title: name,
        disabled: disabled.to_boolean
      )
    end

    #------------------------------ Custom edit button
    def show_button(args = {})
      # Assigns args
      url_to,
      icon,
      name,
      btn_class,
      hide_name,
      hide_icon,
      disabled,
      added_data = get_button_parameters(args)

      # Defaults
      url_to ||= []
      icon ||= :eye
      name ||= t(:show, scope: :actions)
      btn_class ||= 'btn btn-sm btn-link text-nowrap '
      hide_name ||= 'true'
      hide_icon ||= 'false'
      disabled ||= 'false'
      added_data ||= { 'turbo-frame': 'form-entity' }

      link_to(
        print_icon_and_name((hide_icon.to_boolean ? nil : icon), (hide_name.to_boolean ? nil : name)),
        url_to,
        data: added_data,
        class: "#{btn_class}",
        title: name,
        disabled: disabled.to_boolean
      )
    end

    #------------------------------ Custom destroy button
    def destroy_button(args = {})
      # Assigns args
      url_to,
      icon,
      name,
      btn_class,
      hide_name,
      hide_icon,
      disabled,
      style,
      added_data = get_button_parameters(args)

      # Defaults
      url_to ||= []
      icon ||= :trash
      name ||= t(:destroy, scope: :actions)
      btn_class ||= 'btn btn-sm btn-link text-nowrap'
      hide_name ||= 'true'
      hide_icon ||= 'false'
      disabled ||= 'false'
      added_data ||= {
        turbo_method: :delete,
        turbo_confirm: "#{t(:destroy,
                            scope: :actions)}//#{t(:question,
                                                   scope: %i[messages
                                                             destroy])}//#{t(:destroy, scope: :actions)}//btn-danger"
      }

      link_to(
        print_icon_and_name((hide_icon.to_boolean ? nil : icon), (hide_name.to_boolean ? nil : name)),
        url_to,
        data: added_data,
        class: "#{btn_class}",
        title: name,
        disabled: disabled.to_boolean
      )
    end

    #------------------------------------------ form submit button
    def submit_button(args = {})
      # Assigns args
      url_to,
      icon,
      name,
      btn_class,
      hide_name,
      hide_icon,
      disabled,
      added_data = get_button_parameters(args)

      # Defaults
      url_to ||= []
      icon ||= :save
      name ||= t(:save, scope: :actions)
      btn_class ||= 'btn btn-primary btn-lg text-nowrap'
      hide_name ||= 'false'
      hide_icon ||= 'false'
      disabled ||= 'false'
      added_data ||= {}

      case name
      when t(:save, scope: :actions)
        disabled_name = t('actions.execute.saving')
      when t(:search, scope: :actions)
        disabled_name = t('actions.execute.searching')
      when t(:filter, scope: :actions)
        disabled_name = t('actions.execute.filtering')
      when t(:log_in, scope: :actions)
        disabled_name = t('actions.execute.logging_in')
      when t(:send, scope: :actions)
        disabled_name = t('actions.execute.sending')
      when t(:resend, scope: :actions)
        disabled_name = t('actions.execute.resending')
      end

      button_tag(
        data: added_data,
        class: "#{btn_class}",
        title: name,
        disabled: disabled.to_boolean
      ) do
        concat(
          content_tag(:span, class: 'show-when-enabled') do
            print_icon_and_name((hide_icon.to_boolean ? nil : icon), (hide_name.to_boolean ? nil : name), false)
          end
        )
        concat(
          content_tag(:span, class: 'show-when-disabled') do
            concat(
              content_tag(:span, '', class: 'spinner-border spinner-border-sm me-2')
            )
            concat(
              disabled_name
            )
          end
        )
      end
    end

    #------------------------------ Custom Rows Per Page for Paginations
    def rows_per_page_dropdown_button(per_page)
      content_tag(:span, class: 'dropup') do
        concat(
          content_tag(:button, per_page, id: 'per_page_button',
                                         class: 'btn btn-sm btn-link border dropdown-toggle d-flex align-items-center', type: 'button', 'data-bs-toggle': 'dropdown')
        )
        concat(
          content_tag(:ul, class: 'dropdown-menu') do
            [5, 10, 15, 20, 30, 50].each do |num|
              concat(
                content_tag(:li) do
                  link_to(num, url_for(per_page: num, order: params[:order], filter: params[:filter]),
                          class: "dropdown-item #{per_page == num ? 'active' : ''}")
                end
              )
            end
          end
        )
      end
    end

    #------------------------------ Custom toggle filter button
    def filter_button
      filters_used_count = 0
      if params[:filter].present?
        params[:filter].each do |_key, value|
          value.reject!(&:blank?) if value.is_a?(Array)
          filters_used_count += 1 unless value.empty?
        end
      end

      filters_used_count_badge = if filters_used_count > 0
                                   content_tag(:span, filters_used_count,
                                               class: 'badge bg-secondary ms-1')
                                 else
                                   ''
                                 end

      button_tag(
        print_icon_and_name('funnel', "#{t('actions.filters')} #{filters_used_count_badge}".html_safe),
        type: 'button',
        id: 'filter_button',
        class: 'btn btn-lg btn-primary border text-nowrap flex-grow-1',
        data: {
          bs_toggle: 'offcanvas',
          bs_target: '#offcanvas-filter'
        },
        title: t('actions.filters')
      )
    end

    #------------------------------ Custom clear filter button
    def filter_clear_button(link)
      link_to(
        print_icon_and_name('x', t('actions.clear'), false),
        link,
        class: 'btn btn-lg btn-outline-primary text-nowrap d-flex align-items-center',
        title: t('actions.clear')
      )
    end

    def print_icon_and_name(icon = nil, name = nil, responsive = true)
      capture do
        if responsive
          concat(content_tag(:i, '', class: "bi bi-#{icon}")) if icon && !name
          concat(content_tag(:i, '', class: "bi bi-#{icon} me-md-2")) if icon && name
          concat(content_tag(:span, name, class: 'd-none d-md-inline')) if name
        else
          concat(content_tag(:i, '', class: "bi bi-#{icon}")) if icon && !name
          concat(content_tag(:i, '', class: "bi bi-#{icon} me-2")) if icon && name
          concat(content_tag(:span, name, class: '')) if name
        end
      end
    end

    #------------------------------ Custom update status button
    def update_status_button(args = {})
      # Assigns args
      url_to,
      icon,
      name,
      btn_class,
      hide_name,
      hide_icon,
      disabled,
      added_data = get_button_parameters(args)

      # Defaults
      url_to ||= []
      icon ||= 'arrow-right'
      status = args[:status].titleize
      name ||= "Update status to"
      btn_class ||= 'dropdown-item btn btn-sm text-nowrap'
      hide_name ||= 'false'
      hide_icon ||= 'false'
      disabled ||= 'false'
      added_data ||= {}

      form_with(url: url_to, method: :patch, local: true, class: 'dropdown-item-form') do
        button_tag(type: 'submit', class: btn_class, disabled: disabled.to_boolean) do
          concat(
            print_icon_and_name(
              (hide_icon.to_boolean ? nil : icon),
              (hide_name.to_boolean ? nil : "#{name} #{content_tag(:strong, status)}".html_safe),
              false
            )
          )
        end
      end
    end

    #------------------------------ Custom back button
    def back_button(args = {})
      # Assigns args
      url_to,
      icon,
      name,
      btn_class,
      hide_name,
      hide_icon,
      disabled,
      added_data = get_button_parameters(args)

      # Defaults
      url_to ||= []
      icon ||= :arrow_left
      name ||= t(:back, scope: :actions)
      btn_class ||= 'btn btn-lg btn-outlined-secondary flex-grow-1'
      hide_name ||= 'false'
      hide_icon ||= 'false'
      disabled ||= 'false'
      added_data ||= {}

      link_to(
        print_icon_and_name((hide_icon.to_boolean ? nil : icon), (hide_name.to_boolean ? nil : name), false),
        url_to,
        data: added_data,
        class: "#{btn_class}",
        title: name,
        disabled: disabled.to_boolean
      )
    end

    private

    def get_button_parameters(args)
      [
        args[:url_to],
        args[:icon],
        args[:name],
        args[:btn_class],
        args[:hide_name],
        args[:hide_icon],
        args[:disabled],
        args[:added_data]
      ]
    end
  end
end
