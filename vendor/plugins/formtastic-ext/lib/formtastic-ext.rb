require 'formtastic-ext/rrender'

require 'formtastic-ext/grid'
require 'formtastic-ext/date'
require 'formtastic-ext/checkboxes.rb'
require 'formtastic-ext/comment.rb'
require 'formtastic-ext/norender.rb'

module Formtastic #:nodoc:
  class SemanticFormBuilder
    self.required_string = proc { ::Formtastic::Util.html_safe(%{<span class="star">*</span>}) }

    def label(method, options_or_text=nil, options=nil)

      self.optional_string = ''
      if options_or_text.is_a?(Hash)
        return "" if options_or_text[:label] == false
        options = options_or_text
        text = options.delete(:label)
      else
        text = options_or_text
        options ||= {}
      end

      text = localized_string(method, text, :label) || humanized_attribute_name(method)
      text = Formtastic::Util.html_safe(text)

      # special case for boolean (checkbox) labels, which have a nested input
      if options.key?(:label_prefix_for_nested_input)
        text = options.delete(:label_prefix_for_nested_input) + text
      end

      input_name = options.delete(:input_name) || method
      html = required_or_optional_string(options.delete(:required))
      html << super(input_name, text, options) 
    end
  end
end
