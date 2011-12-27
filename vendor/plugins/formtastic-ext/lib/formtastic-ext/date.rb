module Formtastic #:nodoc:
  class SemanticFormBuilder
    def date_input(method, options)
      template.javascript_include_once "calendar"
      template.stylesheet_include_once "calendarview"

      options[:id] = generate_html_id(method, "")
      template.content_for :js do
        template.javascript_tag "document.on('dom:loaded', function() { Calendar.setup({ dateField: '#{options[:id]}', triggerElement: '#{options[:id]}' }); });"
      end
      options[:as].delete if options[:as]
      input(method, options).gsub(/^<li[^>]+>(.*)?<\/li>$/, '\1')
    end
  end
end
