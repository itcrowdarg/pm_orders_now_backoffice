module Shared
  module Form
    module FormTagHelper
      #-- Text field
      def custom_text_field(label_value, input_value, options = {})
        custom_input_field(label_value, input_value, :div, options)
      end

      #-- Text area
      def custom_text_area(label_value, input_value, options = {})
        options[:input_options] = {} if options[:input_options].blank?
        options[:input_options][:style] = 'height:150px;white-space:pre;overflow: auto;'

        custom_input_field(label_value, input_value, :div, options)
      end

      #-- Code field
      def custom_code_field(label_value, input_value, options = {})
        options[:input_options] = {} if options[:input_options].blank?
        options[:input_options][:class] = 'h-initial'

        custom_input_field(label_value, input_value, :pre, options)
      end

      #-- Money field
      def custom_money_field(label_value, input_value, options = {})
        currency = options.delete(:currency)
        options[:input_group_options] = {} if options[:input_group_options].blank?
        options[:input_group_options][:prepend] = prepend_currency_data
        options[:input_group_options][:append] = append_currency_data(currency)

        custom_input_field(label_value, input_value, :div, options)
      end

      #-- Percentage field
      def custom_perc_field(label_value, input_value, options = {})
        currency = options.delete(:currency)
        options[:input_group_options] = {} if options[:input_group_options].blank?
        options[:input_group_options][:prepend] = prepend_perc_data

        custom_input_field(label_value, input_value, :div, options)
      end

      #-- Switch field
      def custom_switch_box_field(label_value, input_value, options = {})
        container_options = initialize_options_for_container(options)
        hint_options = initialize_options_for_hint(options)

        content_tag(:div, container_options) do
          concat(
            content_tag(:div, class: 'd-flex align-items-center') do
              #-- Start Input
              if input_value
                concat(content_tag(:i, '', class: 'me-2 fs-4 text-primary bi bi-toggle2-on'))
              else
                concat(content_tag(:i, '', class: 'me-2 fs-4 text-700 bi bi-toggle2-off'))
              end
              #-- End Input

              #-- Start Label
              concat(label_tag(label_value, label_value, class: 'form-check-label'))
              #-- End Label
            end
          )
          concat(content_tag(:div, hint_options[:value], class: hint_options[:class])) if hint_options[:value].present?
        end
      end

      #-- Text field with copy clipboard
      def custom_text_copy_clipboard_field(label_value, input_value, options = {})
        copy_field_id = "#{label_value.parameterize(separator: '_')}_#{Time.now.to_f.to_s.split('.').last}"
        options[:input_group_options] = {} if options[:input_group_options].blank?
        options[:input_group_options][:append] = copy_clipboard_button(copy_field_id)

        capture do
          concat(
            custom_input_field(label_value, input_value, :div, options)
          )
          concat(
            text_field_tag(copy_field_id, input_value, style: 'display: none;')
          )
        end
      end

      #-- Common custom input field
      def custom_input_field(label_value, input_value, input_kind, options = {})
        container_options = initialize_options_for_container(options)
        input_group_options = initialize_options_for_input_group(options)
        wrapper_options = initialize_options_for_wrapper(options)
        input_options = initialize_options_for_input(options)
        label_options = initialize_options_for_label(options)
        hint_options = initialize_options_for_hint(options)

        content_tag(:div, container_options) do
          concat(
            content_tag(:div, class: input_group_options[:class]) do
              concat(input_group_options[:prepend]) if input_group_options[:prepend].present?
              concat(
                content_tag(:div, class: wrapper_options[:class]) do
                  #-- Start Input
                  case input_kind
                  when :pre
                    concat(content_tag(:pre, input_value, input_options))
                  when :div
                    concat(content_tag(:div, input_value, input_options))
                  end
                  #-- End Input

                  #-- Start Label
                  concat(content_tag(:label, label_value, label_options))
                  #-- End Label
                end
              )
              concat(input_group_options[:append]) if input_group_options[:append].present?
            end
          )
          concat(content_tag(:div, hint_options[:value], class: hint_options[:class])) if hint_options[:value].present?
        end
      end

      def input_group_icon(icon)
        content_tag(:div, class: 'input-group-text') do
          content_tag(:i, '', class: "d-block bi bi-#{icon}")
        end
      end

      private

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

      def initialize_options_for_input(options)
        input_options = initialize_options_for(options, :input_options)
        input_options[:class] = initialize_value_for(input_options, :class, 'form-control-plaintext overflow-auto')
        input_options[:readonly] = initialize_value_for(input_options, :readonly, true, false)
        input_options
      end

      def initialize_options_for_label(options)
        initialize_options_for(options, :label_options)
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

      def prepend_currency_data
        content_tag(:label, I18n.t('number.currency.format.unit'), class: 'input-group-text', tabindex: '-1')
      end

      def prepend_perc_data
        content_tag(:label, '%', class: 'input-group-text', tabindex: '-1')
      end

      def append_currency_data(currency)
        content_tag(:label, currency, class: 'input-group-text', tabindex: '-1')
      end

      def copy_clipboard_button(copy_field_id)
        content_tag(:button, type: 'button', class: 'input-group-text btn border copy-clipboard-field', tabindex: '-1',
                             data: { copy_file_id: copy_field_id }) do
          content_tag(:i, '', class: 'd-block bi bi-copy')
        end
      end
    end
  end
end
