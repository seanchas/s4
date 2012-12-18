module Formtastic #:nodoc:
  class SemanticFormBuilder 
    def rrender(form, prefix = '')
      formName = "#{@object_name.to_s}"
      template.stylesheet_include_once "formstyling.css"

      # проверка на изменения в форме
      if (form.respond_to?('change_alert') && form.change_alert)
        template.javascript_include_once "form_function.js"
        template.content_for :js do
          template.javascript_tag "document.on('dom:loaded', function() { form_change_alert ('#{formName}'); });"
        end
      end

      labelPath = form.class.name.downcase.gsub("::", ".")
      currentGroup = nil
      html = form.class.columns.collect do |column|
        out = ""
        if column.respond_to?('options') && column.options[:group]
          legend = ::Formtastic::I18n::t "labels.#{labelPath}.#{column.options[:group]}", :default => ''
          if currentGroup.nil?
            out << '<li class="group"><fieldset>'
            if legend != '' 
              out << template.content_tag(:legend, legend)
            end
            out << '<ul>'
          elsif currentGroup != column.options[:group]
            out << '</ul></fieldset></li><li class="group"><fieldset>'
            if legend != '' 
              out << template.content_tag(:legend, legend)
            end
            out << '<ul>'
          end

          currentGroup = column.options[:group]
        else
          if !currentGroup.nil?
            out << '</ul></fieldset>'
          end
          currentGroup = nil
        end

        type = column.options[:as] if column.respond_to?('options') && column.options[:as]
        pr = (prefix == '') ? column.name : [prefix, "[#{column.name}]"].join('')

        case type
          when :grid then
            d = (form.attributes[column.name] ? form.attributes[column.name] : column.default)
            out << grid(d, "#{@object_name.to_s}[#{column.name}]", (column.respond_to?('options') ? column.options : {}), form)
          when :form then

            rend = template.semantic_fields_for "#{@object_name.to_s}[#{column.name}]" do |f|
              d = (form.attributes[column.name] ? form.attributes[column.name] : column.default)
              f.rrender(d, pr)
            end.compact.join("\n")
            out << template.content_tag(:li, :class => :form) do 
              template.content_tag(:fieldset) do
                oForm = {:class => "subform"}
                rend = template.content_tag :ul, rend, oForm
                template.content_tag(:legend, ::Formtastic::I18n.t("labels.#{labelPath}.#{column.name}")) <<
                  rend
              end
            end
            
          else
            init_validation = {}
            init_validation = form.init_validation if form.respond_to?('init_validation')

            opts ||= {}
            opts = column.options if column.respond_to?('options')

            opts[:countries] ||= form.countries if form.respond_to?('countries')
            
            opts[:label] = ::Formtastic::I18n.t("labels.#{labelPath}.#{column.name}")
            opts[:labelPath] = labelPath

            # get collection of options for select
            opts[:collection] = form.send("get_#{column.name}_select") if (type == :select || type == 'select') && form.respond_to?("get_#{column.name}_select") 
            
            opts[:input_html] = {}
            opts[:input_html][:class] = []

            if (type == :boolean) && (form.attributes[column.name] == '1' || form.attributes[column.name] == true)
              opts[:input_html][:checked] = :checked
            end

            if prefix != '' && type != :boolean && type != 'boolean'
              opts[:input_html][:value] = form.attributes[column.name] if !form.attributes[column.name].nil?
            end
            
            if type == :date && !form.attributes[column.name].nil?
              v = form.attributes[column.name] 
              opts[:input_html][:value] = template.l(v.to_date) if !v.nil? && v != ""
            end
            
            out << input(column.name, opts)
            if column.respond_to?("options") && column.options[:description]
              out = adddescription out, [@object_name.to_s.split('_').last, column.name], labelPath
            end
            out
        end
      end

      if !currentGroup.nil?
        html << '</ul></fieldset>'
      end

      if prefix == ''
        btns = commit_button().gsub(/<li[^>]*>(.*)?<\/li>$/, '\1') if !form.respond_to?("buttons")
        btns = form.buttons.collect do |btn|
          input = btn.delete(:input)

          label = btn.delete(:label)
          if input != :submit
            template.content_tag(:"#{input}", label, btn)
          else
            commit_button().gsub(/<li[^>]*>(.*)?<\/li>$/, '\1')
          end
        end if form.respond_to?("buttons")
        html << template.content_tag(:li, btns, :class => 'buttons');
      end
      html = [template.content_tag(:ul, html)]
      html << template.content_tag(:div, '', :class => :clean)
    end
    
private
    def adddescription(html, name, labelPath)
      str = ::Formtastic::I18n.t("descriptions.#{labelPath}.#{name.last}")
      name = name.join('_')
      desc = template.content_tag(:span, '?', :class => 'description', :id => "#{name}_description") <<
             template.javascript_tag("new Tip('#{name}_description', '#{Formtastic::Util.html_safe(str)}', {hook: {target: 'bottomRight', tip: 'topLeft'}});")
      htmlClone = html.clone
      htmlClone = html.gsub(/^(.*)?(<\/label>)(.*)/, "\\1#{desc}\\2\\3")
      if htmlClone == html
        html.gsub(/^(.*)?(<\/li>)(.*)/, "\\1#{desc}\\2\\3")
      else
        html = htmlClone
      end
    end
  end
end
