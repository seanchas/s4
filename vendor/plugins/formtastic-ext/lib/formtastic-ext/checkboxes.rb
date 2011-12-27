module Formtastic #:nodoc:
  class SemanticFormBuilder
    def checkboxes_input(method, options)
      collection = []
      
      options[:collection] ||= {}
      options[:collection].map do |c|
        collection << ([::Formtastic::I18n.t("labels.checkboxes.#{method}.#{(c.is_a?(Array) ? c.first : c)}")] << c) 
      end
      options[:collection] = collection
      
      html = check_boxes_input(method, options).gsub(/^<fieldset[^>]*><legend[^>]*>(.*)?<\/legend>(.*)?<\/fieldset>$/, '\1\2')
      html.gsub(/^(<label[^>]*>)(.*)?(<span[^>]*>.*?<\/span>)(<\/label>)(.*)$/, '\3\1\2\4\5').
           gsub(/^(.*)?(<\/label>)<input[^>]*>(.*)?$/, '\1\2\3');
    end
  end
end
