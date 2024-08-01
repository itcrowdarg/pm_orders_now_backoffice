ActionView::Base.field_error_proc = proc do |html_tag, instance|
  html = Nokogiri::HTML::DocumentFragment.parse(html_tag)
  html = html.at_css('input') || html.at_css('select') || html.at_css('textarea')
  unless html.nil?
    feedback_id = "id=\"feedback_#{html['id']}\""
    aria_feedback_id = "aria-describedby=\"feedback#{html['id']}\""
    html_tag = html_tag.gsub('<input', "<input #{aria_feedback_id}")
    html_tag = html_tag.gsub('form-control', 'form-control is-invalid')

    unless (html.attributes['data-error'].present? && html.attributes['data-error']&.value == 'false')
      unless html.attributes["type"]&.value == "hidden"
        if instance.error_message.kind_of?(Array)
          html_tag += "<div #{feedback_id} class=\"invalid-feedback backend-validation\">#{instance.error_message.uniq.join(', ')}</div>".html_safe
        else
          html_tag += "<div #{feedback_id} class=\"invalid-feedback backend-validation\">#{instance.error_message}</div>".html_safe
        end
      end
    end


  end
  html_tag.html_safe
end
