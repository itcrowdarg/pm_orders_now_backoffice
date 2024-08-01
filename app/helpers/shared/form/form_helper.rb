module Shared
  module Form
    module FormHelper
      ActionView::Helpers::FormBuilder.class_eval do
        #-- Text field
        def custom_text_field(input_name, options = {})
          kind = options.delete(:kind)

          if kind == :normal
            custom_normal_input_field(:text_field, input_name, options)
          else
            custom_floating_input_field(:text_field, input_name, options)
          end
        end

        #-- Number field
        def custom_number_field(input_name, options = {})
          kind = options.delete(:kind)

          if kind == :normal
            custom_normal_input_field(:number_field, input_name, options)
          else
            custom_floating_input_field(:number_field, input_name, options)
          end
        end

        #-- File field
        def custom_file_field(input_name, options = {})
          kind = options.delete(:kind)

          if kind == :normal
            custom_normal_input_field(:file_field, input_name, options)
          else
            custom_floating_input_field(:file_field, input_name, options)
          end
        end

        #-- Email field
        def custom_email_field(input_name, options = {})
          kind = options.delete(:kind)

          if kind == :normal
            custom_normal_input_field(:email_field, input_name, options)
          else
            custom_floating_input_field(:email_field, input_name, options)
          end
        end

        #-- Money field
        def custom_money_field(input_name, options = {})
          kind = options.delete(:kind)
          currency = options.delete(:currency)
          options[:input_group_options] = {} if options[:input_group_options].blank?
          options[:input_group_options][:prepend] = prepend_currency_data
          options[:input_group_options][:append] = append_currency_data(currency) if currency.present?

          if kind == :normal
            custom_normal_input_field(:number_field, input_name, options)
          else
            custom_floating_input_field(:number_field, input_name, options)
          end
        end

        #-- Percentage field
        def custom_perc_field(input_name, options = {})
          kind = options.delete(:kind)
          options[:input_group_options] = {} if options[:input_group_options].blank?
          options[:input_group_options][:prepend] = prepend_perc_data

          if kind == :normal
            custom_normal_input_field(:number_field, input_name, options)
          else
            custom_floating_input_field(:number_field, input_name, options)
          end
        end

        #-- Password field
        def custom_password_field(input_name, options = {})
          kind = options.delete(:kind)
          options[:input_group_options] = {} if options[:input_group_options].blank?
          options[:input_group_options][:append] = toggle_password_button

          if kind == :normal
            custom_normal_input_field(:password_field, input_name, options)
          else
            custom_floating_input_field(:password_field, input_name, options)
          end
        end

        #-- Select field
        def custom_select_field(input_name, choices, html_options = {}, options = {})
          kind = options.delete(:kind)
          options[:input_options] = {} if options[:input_options].blank?
          unique_id = options[:input_options].delete(:unique_id)
          if unique_id.present?
            options[:input_options][:id] = "#{@object_name}_#{input_name}_#{Time.now.to_f.to_s.split('.').last}"
          end

          options[:choices] = choices
          options[:html_options] = html_options

          if kind == :normal
            custom_normal_input_field(:select, input_name, options)
          else
            custom_floating_input_field(:select, input_name, options)
          end
        end

        #-- Select with extend_search field
        def custom_select_with_extend_search_field(input_name, choices, html_options = {}, options = {})
          kind = options.delete(:kind)
          options[:input_options] = {} if options[:input_options].blank?
          unique_id = options[:input_options].delete(:unique_id)
          if unique_id.present?
            options[:input_options][:id] = "#{@object_name}_#{input_name}_#{Time.now.to_f.to_s.split('.').last}"
          end

          search_url = options.delete(:search_url)
          next_frame_id = options.delete(:next_frame_id)
          options[:input_group_options] = {} if options[:input_group_options].blank?
          options[:input_group_options][:append] = extend_search_button(search_url, next_frame_id)

          options[:choices] = choices
          options[:html_options] = html_options

          if kind == :normal
            custom_normal_input_field(:select, input_name, options)
          else
            custom_floating_input_field(:select, input_name, options)
          end
        end

        #-- Select button field
        def custom_select_button_field(input_name, choices, options = {})
          container_options = initialize_options_for_container(options)
          input_options = initialize_options_for_input(options, :check_box, input_name)
          label_options = initialize_options_for_label(options, :check_box)
          input_options[:class] = 'btn-check'
          label_options[:class] = 'btn btn-lg btn-outline-primary'

          @template.content_tag(:div, container_options) do
            @template.concat(label(input_name, class: 'form-label text-muted mb-0'))
            @template.concat(
              @template.content_tag(:div, class: 'btn-group d-flex') do
                choices.each do |choice|
                  #-- Start Input
                  input_options[:id] = "#{input_name}_#{choice.last}"
                  @template.concat(radio_button(input_name, choice.last, input_options))
                  #-- End Input

                  #-- Start Label
                  label_options[:for] = "#{input_name}_#{choice.last}"
                  @template.concat(label(choice.first, label_options))
                  #-- End Label
                end
              end
            )
          end
        end

        #-- Datepicker field
        def custom_datepicker_field(input_name, options = {})
          kind = options.delete(:kind)
          options[:input_group_options] = {} if options[:input_group_options].blank?
          options[:input_group_options][:append] = datepicker_button("#{@object_name}_#{input_name}")

          options[:input_options] = {} if options[:input_options].blank?
          options[:input_options][:data] = {} if options[:input_options][:data].blank?
          options[:input_options][:data][:input] = 'datepicker'

          if kind == :normal
            custom_normal_input_field(:text_field, input_name, options)
          else
            custom_floating_input_field(:text_field, input_name, options)
          end
        end

        #-- Datetimepicker field
        def custom_datetimepicker_field(input_name, options = {})
          kind = options.delete(:kind)
          options[:input_group_options] = {} if options[:input_group_options].blank?
          options[:input_group_options][:append] = datetimepicker_button("#{@object_name}_#{input_name}")

          options[:input_options] = {} if options[:input_options].blank?
          options[:input_options][:data] = {} if options[:input_options][:data].blank?
          options[:input_options][:data][:input] = 'datetimepicker'

          if kind == :normal
            custom_normal_input_field(:text_field, input_name, options)
          else
            custom_floating_input_field(:text_field, input_name, options)
          end
        end

        #-- Daterangepicker field
        def custom_daterangepicker_field(input_name, options = {})
          kind = options.delete(:kind)
          options[:input_group_options] = {} if options[:input_group_options].blank?
          options[:input_group_options][:append] = daterangepicker_button("#{@object_name}_#{input_name}")

          options[:input_options] = {} if options[:input_options].blank?
          options[:input_options][:data] = {} if options[:input_options][:data].blank?
          options[:input_options][:data][:input] = 'daterangepicker'

          if kind == :normal
            custom_normal_input_field(:text_field, input_name, options)
          else
            custom_floating_input_field(:text_field, input_name, options)
          end
        end

        #-- Datetimerangepicker field
        def custom_datetimerangepicker_field(input_name, options = {})
          kind = options.delete(:kind)
          options[:input_group_options] = {} if options[:input_group_options].blank?
          options[:input_group_options][:append] = daterangepicker_button("#{@object_name}_#{input_name}")

          options[:input_options] = {} if options[:input_options].blank?
          options[:input_options][:data] = {} if options[:input_options][:data].blank?
          options[:input_options][:data][:input] = 'datetimerangepicker'

          if kind == :normal
            custom_normal_input_field(:text_field, input_name, options)
          else
            custom_floating_input_field(:text_field, input_name, options)
          end
        end

        #-- Checkbox field
        def custom_check_box_field(input_name, options = {})
          container_options = initialize_options_for_container(options)
          input_options = initialize_options_for_input(options, :check_box, input_name)
          label_options = initialize_options_for_label(options, :check_box)
          hint_options = initialize_options_for_hint(options)
          input_options[:class] = 'form-check-input'
          label_options[:class] = 'form-check-label'

          @template.content_tag(:div, container_options) do
            @template.concat(
              @template.content_tag(:div, class: 'form-check') do
                #-- Start Input
                @template.concat(check_box(input_name, input_options))
                #-- End Input

                #-- Start Label
                @template.concat(label(input_name, label_options))
                #-- End Label
              end
            )
            if hint_options[:value].present?
              @template.concat(@template.content_tag(:div, hint_options[:value],
                                                     class: hint_options[:class]))
            end
          end
        end

        #-- Switch field
        def custom_switch_box_field(input_name, options = {})
          container_options = initialize_options_for_container(options)
          input_options = initialize_options_for_input(options, :check_box, input_name)
          label_options = initialize_options_for_label(options, :check_box)
          hint_options = initialize_options_for_hint(options)
          input_options[:class] = 'form-check-input'
          label_options[:class] = 'form-check-label'

          @template.content_tag(:div, container_options) do
            @template.concat(
              @template.content_tag(:div, class: 'form-check form-switch') do
                #-- Start Input
                @template.concat(check_box(input_name, input_options))
                #-- End Input

                #-- Start Label
                @template.concat(label(input_name, label_options))
                #-- End Label
              end
            )
            if hint_options[:value].present?
              @template.concat(@template.content_tag(:div, hint_options[:value],
                                                     class: hint_options[:class]))
            end
          end
        end

        #-- Radio field
        def custom_radio_field(input_name, value, options = {})
          container_options = initialize_options_for_container(options)
          input_options = initialize_options_for_input(options, :check_box, input_name)
          label_options = initialize_options_for_label(options, :check_box)
          hint_options = initialize_options_for_hint(options)
          input_options[:class] = 'form-check-input'
          label_options[:class] = 'form-check-label'

          @template.content_tag(:div, container_options) do
            @template.concat(
              @template.content_tag(:div, class: 'form-check') do
                #-- Start Input
                input_options[:id] = "#{input_name}_#{value}"
                @template.concat(radio_button(input_name, value, input_options))
                #-- End Input

                #-- Start Label
                label_options[:for] = "#{input_name}_#{value}"
                @template.concat(label(input_name, label_options))
                #-- End Label
              end
            )
            if hint_options[:value].present?
              @template.concat(@template.content_tag(:div, hint_options[:value],
                                                     class: hint_options[:class]))
            end
          end
        end

        #-- Nav item field
        def custom_nav_item_field(input_name, value, options = {})
          container_options = initialize_options_for_container(options)
          input_options = initialize_options_for_input(options, :check_box, input_name)
          label_options = initialize_options_for_label(options, :check_box)
          container_options[:class] = 'nav-item'
          input_options[:class] = 'btn-check'
          label_options[:class] = 'nav-link'

          @template.content_tag(:li, container_options) do
            #-- Start Input
            input_options[:id] = "#{input_name}_#{value}"
            @template.concat(radio_button(input_name, value, input_options))
            #-- End Input

            #-- Start Label
            label_options[:for] = "#{input_name}_#{value}"
            @template.concat(label(input_name, label_options))
            #-- End Label
          end
        end

        #-- Text area
        def custom_text_area(input_name, options = {})
          kind = options.delete(:kind)
          options[:input_options] = {} if options[:input_options].blank?
          options[:input_options][:rows] = '6'
          options[:input_options][:style] = 'min-height: 6rem; padding-top: 2rem'
          options[:input_options][:placeholder] = nil

          if kind == :normal
            custom_normal_input_field(:text_area, input_name, options)
          else
            custom_floating_input_field(:text_area, input_name, options)
          end
        end

        #-- Filter hidden fields
        def advanced_filter_fields(fields, orders)
          @template.capture do
            fields.each do |field|
              @template.concat(
                hidden_field(field.to_sym)
              )
            end
            orders.each_with_index do |order, index|
              @template.concat(
                @template.hidden_field_tag('order[]', order, id: "order_#{index}")
              )
            end
          end
        end

        #-- Image input with preview
        def custom_image_field(image, image_obj)
          @template.content_tag(:div, data: { input: 'image-uploader' }) do
            @template.concat(
              @template.image_tag(image.object.decorate.file_url,
                                  class: 'input-preview img-thumbnail rounded w-100 mb-1')
            )
            if image_obj.file.attached?
              @template.concat(
                image.custom_check_box_field(:purge, container_options: { class: 'mb-3 purge-check' },
                                                     input_options: { placeholder: true })
              )
            end
            @template.concat(
              image.custom_file_field(:file, input_options: { class: 'input-file', placeholder: true })
            )
            @template.concat(
              image.hidden_field(:kind)
            )
          end
        end

        private

        #-- Common custom input field
        def custom_floating_input_field(input_kind, input_name, options = {})
          container_options = initialize_options_for_container(options)
          input_group_options = initialize_options_for_input_group(options)
          wrapper_options = initialize_options_for_wrapper(options)
          input_options = initialize_options_for_input(options, input_kind, input_name)
          label_options = initialize_options_for_label(options, input_kind)
          hint_options = initialize_options_for_hint(options)

          @template.content_tag(:div, container_options) do
            @template.concat(
              @template.content_tag(:div, class: input_group_options[:class]) do
                @template.concat(input_group_options[:prepend]) if input_group_options[:prepend].present?
                @template.concat(
                  @template.content_tag(:div, class: wrapper_options[:class]) do
                    #-- Start Input
                    @template.concat(print_appropriate_input(input_kind, input_name, input_options, options))
                    #-- End Input

                    #-- Start Label
                    @template.concat(label(input_name, label_options))
                    #-- End Label
                  end
                )
                @template.concat(input_group_options[:append]) if input_group_options[:append].present?
              end
            )
            if hint_options[:value].present?
              @template.concat(@template.content_tag(:div, hint_options[:value],
                                                     class: hint_options[:class]))
            end
          end
        end

        def custom_normal_input_field(input_kind, input_name, options = {})
          container_options = initialize_options_for_container(options)
          input_group_options = initialize_options_for_input_group(options)
          input_options = initialize_options_for_input(options, input_kind, input_name)
          label_options = initialize_options_for_label(options, input_kind)
          hint_options = initialize_options_for_hint(options)
          label_options[:class] = 'form-label'

          @template.content_tag(:div, container_options) do
            if options[:label] != false
              #-- Start Label
              @template.concat(label(input_name, label_options))
              #-- End Label
            end
            @template.concat(
              @template.content_tag(:div, class: input_group_options[:class]) do
                @template.concat(input_group_options[:prepend]) if input_group_options[:prepend].present?

                #-- Start Input
                @template.concat(print_appropriate_input(input_kind, input_name, input_options, options))
                #-- End Input

                @template.concat(input_group_options[:append]) if input_group_options[:append].present?
              end
            )
            if hint_options[:value].present?
              @template.concat(@template.content_tag(:div, hint_options[:value],
                                                     class: hint_options[:class]))
            end
          end
        end

        def print_appropriate_input(input_kind, input_name, input_options, options)
          if input_kind == :select
            choices = options.delete(:choices)
            html_options = options.delete(:html_options)

            select(input_name, choices, html_options, input_options)
          else
            send(input_kind, input_name, input_options)
          end
        end

        def initialize_options_for_container(options)
          container_options = initialize_options_for(options, :container_options)
          container_options[:class] = initialize_value_for(container_options, :class, 'mb-3', false)
          container_options
        end

        def initialize_options_for_input_group(options)
          input_group_options = initialize_options_for(options, :input_group_options)
          input_group_options[:class] = initialize_value_for(input_group_options, :class, 'input-group')
          input_group_options
        end

        def initialize_options_for_wrapper(options)
          wrapper_options = initialize_options_for(options, :wrapper_options)
          wrapper_options[:class] = initialize_value_for(wrapper_options, :class, 'form-floating')
          wrapper_options
        end

        def initialize_options_for_input(options, input_kind, input_name)
          input_options = initialize_options_for(options, :input_options)
          if input_kind == :select && tag_value = input_options[:placeholder]
            placeholder = tag_value if tag_value.is_a?(String)
            method_and_value = tag_value.is_a?(TrueClass) ? input_name : "#{input_name}.#{tag_value}"
            placeholder ||= ActionView::Helpers::Tags::Translator.new(object, @object_name.to_s, method_and_value,
                                                                      scope: 'helpers.placeholder').translate
            placeholder ||= input_name.humanize
            input_options[:placeholder] = placeholder
          end

          input_options[:class] = initialize_value_for(input_options, :class, 'form-control')
          input_options[:data] = initialize_value_for(input_options, :data, {}, false)
          input_options[:data][:error_required] =
            initialize_value_for(input_options[:data], :error_required, I18n.t('errors.messages.blank'))
          input_options[:data][:error_email] =
            initialize_value_for(input_options[:data], :error_email, I18n.t('errors.messages.invalid'))
          input_options
        end

        def initialize_options_for_label(options, input_kind)
          label_options = initialize_options_for(options, :label_options)
          if input_kind == :select
            label_options[:class] = initialize_value_for(label_options, :class, 'floating-select-label')
          end
          label_options
        end

        def initialize_options_for_hint(options)
          hint_options = initialize_options_for(options, :hint_options)
          hint_options[:class] = initialize_value_for(hint_options, :class, 'form-text')
          hint_options
        end

        def initialize_value_for(options, value_key, default, inclusive = true)
          if options[value_key].to_s.blank?
            default
          else
            (inclusive ? "#{default} #{options[value_key]}" : options[value_key])
          end
        end

        def initialize_options_for(options, option_key)
          options[option_key].presence || {}
        end

        def prepend_perc_data
          @template.content_tag(:label, '%', class: 'input-group-text', tabindex: '-1')
        end

        def prepend_currency_data
          @template.content_tag(:label, I18n.t('number.currency.format.unit'), class: 'input-group-text',
                                                                               tabindex: '-1')
        end

        def append_currency_data(currency)
          @template.content_tag(:label, currency, class: 'input-group-text', tabindex: '-1')
        end

        def toggle_password_button
          @template.content_tag(:button, type: 'button', class: 'btn border toggle-password-field', tabindex: '-1') do
            @template.concat(@template.content_tag(:i, '', class: 'd-block bi bi-eye', data: { show_password: 'true' }))
            @template.concat(@template.content_tag(:i, '', class: 'd-none bi bi-eye-slash',
                                                           data: { show_password: 'false' }))
          end
        end

        def extend_search_button(search_url, next_frame_id)
          @template.link_to(search_url, class: 'btn border d-flex align-items-center',
                                        data: { 'turbo-frame': next_frame_id }, tabindex: '-1') do
            @template.content_tag(:i, '', class: 'd-block bi bi-search')
          end
        end

        def datepicker_button(element_id)
          @template.content_tag(:label, class: 'input-group-text', tabindex: '-1', for: element_id,
                                        style: 'cursor: pointer;') do
            @template.content_tag(:i, '', class: 'd-block bi bi-calendar3')
          end
        end

        def datetimepicker_button(element_id)
          @template.content_tag(:label, class: 'input-group-text', tabindex: '-1', for: element_id,
                                        style: 'cursor: pointer;') do
            @template.content_tag(:i, '', class: 'd-block bi bi-clock')
          end
        end

        def daterangepicker_button(element_id)
          @template.content_tag(:label, class: 'input-group-text', tabindex: '-1', for: element_id,
                                        style: 'cursor: pointer;') do
            @template.content_tag(:i, '', class: 'd-block bi bi-calendar3-range')
          end
        end
      end
    end
  end
end
