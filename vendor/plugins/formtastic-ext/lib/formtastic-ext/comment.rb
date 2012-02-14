module Formtastic #:nodoc:
  class SemanticFormBuilder
    def comment_input(method, options)
      opts = {}
      opts = options[:i18n] if !options[:i18n].nil?
      opts[:scope] = {}
      textilize = !opts[:textilize].nil?

      comment = ::Formtastic::I18n.t("comments.#{options[:labelPath]}.#{method}", opts)
      comment = template.textilize comment if textilize

      wrapper_html = options.delete(:wrapper_html) || {}
      wrapper_html[:id]  ||= generate_html_id(method)
      wrapper_html[:class] = ([] << wrapper_html[:class]).flatten.compact.join(' ')

      Formtastic::Util.html_safe(comment)#comment
    end
  end
end
