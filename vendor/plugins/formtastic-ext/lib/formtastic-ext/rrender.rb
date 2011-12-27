module Formtastic #:nodoc:
  class SemanticFormBuilder
    def rrender(form, prefix = '')
      template.stylesheet_include_once "formstyling.css"

      labelPath = form.class.name.downcase.gsub("::", ".")
      html = form.class.columns.collect do |column|
        type = column.options[:as] if column.respond_to?('options') && column.options[:as]
        pr = (prefix == '') ? column.name : [prefix, "[#{column.name}]"].join('')

        case type
          when :grid then
            d = (form.attributes[column.name] ? form.attributes[column.name] : column.default)
            grid d, "#{@object_name.to_s}[#{column.name}]", (column.respond_to?('options') ? column.options : {})
          when :form then

            rend = template.semantic_fields_for "#{@object_name.to_s}[#{column.name}]" do |f|
              d = (form.attributes[column.name] ? form.attributes[column.name] : column.default)
              f.rrender(d, pr)
            end.compact.join("\n")
            template.content_tag(:fieldset) do 
              template.content_tag(:legend, ::Formtastic::I18n.t("labels.#{labelPath}.#{column.name}")) <<
                rend
            end
            
          else
            opts ||= {}
            opts = column.options if column.respond_to?('options')
            
            opts[:label] = ::Formtastic::I18n.t("labels.#{labelPath}.#{column.name}")
            opts[:labelPath] = labelPath

            opts[:input_html] ||= {}
            if (type == :boolean) && form.attributes[column.name] == '1'
              opts[:input_html][:checked] = :checked
            end
            #html = input(:"#{prefix}#{prefix==''?'':'_'}#{column.name}", opts)
            if prefix != ''
              #template.logger.debug "DDDDDDDDDDDD:#{column.name}@#{form.attributes[column.name]}@ #{form.attributes.to_yaml}\n$$$$$$$$$$$$$$$$$$$\n"
              #opts[:for] = :kollegialorgan
              opts[:input_html][:value] = form.attributes[column.name] if !form.attributes[column.name].nil?
            end
            
            html = input(column.name, opts)
            #html = input("#{prefix}#{column.name}", opts)
            if column.options[:description]
              html = adddescription html, column.name, labelPath
            end
            html
        end
      end

      if prefix == ''
        btns = commit_button().gsub(/<li[^>]*>(.*)?<\/li>$/, '\1') if !form.respond_to?("buttons")
        btns = form.buttons.collect do |btn|
          input = btn.delete(:input)
          template.logger.debug "input: #{input.to_yaml}\n#{btn.to_yaml}\n##############"
          label = btn.delete(:label)
          if input != :submit
            template.content_tag(:"#{input}", label, btn)
          else
            commit_button().gsub(/<li[^>]*>(.*)?<\/li>$/, '\1')
          end
        end if form.respond_to?("buttons")
        html << template.content_tag(:li, btns, :class => 'buttons');
      end
      html << template.content_tag(:div, '', :class => :clean)
    end
    
private
    def adddescription(html, name, labelPath)
      str = ::Formtastic::I18n.t("descriptions.#{labelPath}.#{name}")
      desc = template.content_tag(:span, '?', :class => 'description', :id => "#{name}_description") <<
             template.javascript_tag("new Tip('#{name}_description', '#{Formtastic::Util.html_safe(str)}', {hook: {target: 'bottomRight', tip: 'topLeft'}});")
      
      html.gsub(/^(.*)?(<\/label>)(.*)/, "\\1#{desc}\\2\\3")
    end
  end
end
