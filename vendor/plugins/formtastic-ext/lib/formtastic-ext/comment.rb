module Formtastic #:nodoc:
  class SemanticFormBuilder
    def comment_input(method, options)
      comment = ::Formtastic::I18n.t("comments.#{options[:labelPath]}.#{method}")

      wrapper_html = options.delete(:wrapper_html) || {}
      wrapper_html[:id]  ||= generate_html_id(method)
      wrapper_html[:class] = ([] << wrapper_html[:class]).flatten.compact.join(' ')
      
      return template.content_tag(:li, Formtastic::Util.html_safe(comment), wrapper_html)
    end
  end
end
