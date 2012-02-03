module Formtastic #:nodoc:
  class SemanticFormBuilder
    configurables = [:grid_column_exclude]
    if respond_to?(:class_attribute)
      class_attribute *configurables
    else
      class_inheritable_accessor *configurables
    end
    self.grid_column_exclude = [:comment]
      
    def grid(grid, name, column_options, form = {})
      grid[:name] = name
      labelPath = grid.class.name.downcase.gsub("::", ".")
      options ||= {}
      grid_resources

      id = name
      template.reset_cycle
      html = template.content_tag(:table, :class => "resource", :id => id) do
        [grid_headers(grid), grid_rowset(grid)].join
      end

      if grid.respond_to?("addForm") && grid.addForm != false
        buttonopts ||= {}
        buttonopts[:onclick] = 'return false;'
        buttonopts[:action] = grid.addForm if grid.addForm.is_a?(::String)
        html << template.content_tag(:button, ::Formtastic::I18n.t("buttons.grid_add"), buttonopts)
        if !grid.addForm.is_a?(::String)
          addformname = grid_get_formname(grid.addForm)
          template.content_for :content_footer do
            addformcontent = grid_add_form(grid.addForm)
            template.content_tag(:div, addformcontent, :style => "display:none;", :id => "#{addformname}_div", :class => "dialog-box") if addformcontent != ""
          end
          
          options[:meta] ||= {}
          grid.addForm.class.columns.collect do |col|
            name = [addformname, col.name].join('_')
            metadata = {}
            if col.options[:as]
              case col.options[:as]
                when :boolean then
                  metadata = {:type => col.options[:as], :name => name}
                when :checkboxes then
                  metadata = {:type => col.options[:as], :name => name}
              end
            end
            
            if (grid_column_exclude & [col.options[:as]]).length == 0
              options[:meta]["#{col.name}"] = (metadata != {} ? metadata : name)
            end
            
          end
  
          options[:addform] = addformname
          options[:addformtitle] = ::Formtastic::I18n.t("windowTitle.#{labelPath}")
        end
      end

      if column_options[:empty_checkbox]
        empty_grid_opts = {:as => :boolean, :required => false, :label => ::Formtastic::I18n.t("labels.empty_grid"), :input_html => {}}
        empty_grid_opts[:input_html][:checked] = :checked if form[column_options[:empty_checkbox].to_sym]

        t = input(column_options[:empty_checkbox].to_sym, empty_grid_opts)
        t = t.gsub(/^(.*)?(<label[^>]*>.*<\/label>)(.*)?/, '\2')
        html << template.content_tag(:br) << 
             template.content_tag(:div, t, {:class => :empty_grid})
      end

      html = template.content_tag(:fieldset) do
        template.content_tag(:legend, ::Formtastic::I18n.t("labels.#{labelPath}")) <<
          (column_options[:comment] ? ::Formtastic::I18n.t("comments.#{labelPath}.#{name}") : '') << 
          html
      end

      if grid.respond_to?("rowset")
        options[:rowset] ||= {}
        options[:rowset][:data] ||= []
        grid.rowset.map do |row|
          grid.class.columns.collect do |column|
            if column.attrs[:as] == 'date' || column.attrs[:as] == :date
              row[column.name] = template.l(row[column.name].to_date) rescue ""
            end
          end
          options[:rowset][:data] << row
        end
      end

      options[:delete_row_message] = ::Formtastic::I18n::t "confirm.#{labelPath}.delete_row_message", :default => ::Formtastic::I18n::t("confirm.delete_row_message")
      options[:delete_row_title] = ::Formtastic::I18n::t "confirm.#{labelPath}.delete_row_title", :default => ::Formtastic::I18n::t("confirm.delete_row_title")

      template.content_for :js do
        template.javascript_tag " document.observe('dom:loaded', function() { new formtasticGrid('#{id}'" << (", " << options.to_json if options != {}) << ") } ); "
      end
      template.content_tag(:li, html, :class => :grid)
    end
    
private
    def printHash(h)
      h.map do |k,v| 
        v.is_a?(String) ? "#{k}:{#{printHash(v)}}" : "#{k}:#{v}"
      end.compact.join(",")
    end

    def grid_get_formname(form)
      form.class.human_name.gsub("::", "_").downcase
    end

    def grid_resources()
      template.javascript_include_once "grid"
      template.stylesheet_include_once "grid"
    end
    
    def grid_added_forms()
      @grid_added_forms ||= {}
    end
    
    def grid_add_form(form_class)
      html = ""
      formname = grid_get_formname(form_class)
      unless grid_added_forms[form_class.class.name]
        grid_added_forms[form_class.class.name] = ""
        fields = template.semantic_fields_for formname do |f|
            f.rrender(form_class)
        end.compact.join("\n")

        rend = template.content_tag(:form, fields, :name => formname, :class => [:formtastic, :addform].join(' '))
        grid_added_forms[form_class.class.name] << rend
        html << rend
      end
      html
    end

    def grid_headers(grid)
      model = grid.class.name.gsub(/::/, '.').downcase
      tpl ||= [] #template

      columnsKeys = []
      cells = grid.class.columns.collect do |column|
        tpl << template.content_tag(:td, '#{' << "#{column.name}" << '}') #template
        columnsKeys << column.name
        template.content_tag(:td, :class => column.name) do
          if grid.respond_to?("scope")
            ::Formtastic::I18n.t("#{grid.scope}.#{column.name}")
          else
            ::Formtastic::I18n.t("grids.#{model}.#{column.name}")
          end
        end
      end
      
      ## add hidden column
      
      diff = getHiddenColumns(grid).collect do |col|
        '#{' << "#{col}" << '}' if grid.addForm.class.columns.select { |item| item.name == col }.first.attrs[:as] != :comment
      end
      tpl << template.content_tag(:td, diff, :style => 'display: none;')
      
      if grid.respond_to?("getActions")
        cells << template.content_tag(:td, ::Formtastic::I18n.t("grids.actions_title"))
        
        # template
        tplActions ||= []
        tplActions << template.content_tag(:div, template.content_tag(:a, ::Formtastic::I18n.t("actions.edit"), :href => '#', :type => "edit"))
        tplActions << template.content_tag(:div, template.content_tag(:a, ::Formtastic::I18n.t("actions.delete"), :href => '#', :type => "delete"))
        tpl << template.content_tag(:td, tplActions, {:class => "actions"}) 
      end
      
      #empty rowset
      display = grid.respond_to?('rowset') && grid.rowset.length > 0
      
      template.content_tag(:thead) do
        template.content_tag(:tr, cells) <<
        template.content_tag(:tr, template.content_tag(:td, ::Formtastic::I18n.t("grids.empty_table"), :colspan => grid.class.columns.length + 1), :class => 'empty_table odd', :empty_table => true, :style => "display: #{display ? 'none' : 'auto'};") <<
        template.content_tag(:tr, tpl.compact.join(""), :template => true, :style => "display: none;")
      end
    end
    
    def grid_rowset(grid)
      rowid = 0
      html = ''
      if grid.respond_to?('rowset') && grid.rowset.length > 0
        html = grid.rowset.collect do |row|
          html = template.content_tag(:tr, grid_row(grid, row, rowid), :class => template.cycle("odd", "even"), :rowid => rowid)
          rowid += 1
          html
        end
      end
      template.content_tag(:tbody, html, :tpl => [grid[:name], '[%i%]'].join(''))
    end
    
    def grid_row(grid, data, rowid)
      columnsKeys = []
      labelPath = grid.class.name.downcase.gsub("::", ".")
      html = grid.class.columns.collect do |column|
        value = data[column.name]

        columnsKeys << column.name
        template.content_tag(:td) do
          hidden = 
          case column.options[:as]
            when :checkboxes, "checkboxes" then
              value.collect do |v|
                template.hidden_field_tag([grid[:name], '[', rowid, '][', column.name, '][]'].join(''), v, :tpl => 1)
              end.compact.join('')
            else
              template.hidden_field_tag([grid[:name], '[', rowid, '][', column.name, ']'].join(''), value, :tpl => 1)
          end

          value = case column.options[:as]
            when :date, "date" then
              template.l(value.to_date) rescue ""
            when :select, "select" then
              m = "get_#{column.name}_select"
              collection = []
              collection = grid.send(m) if grid.respond_to?("get_#{column.name}_select")
              dd = collection.select do |v|
                id = v.length > 1 ? v[1] : v[0]
                id == value
              end
              dd.length > 0 && dd[0].length > 0 ? dd[0][0] : ''
            when :time, "time" then
              template.l(value.to_time) rescue ""
            when :checkboxes, "checkboxes" then
              value.collect do |v|
                ::Formtastic::I18n.t("labels.checkboxes.#{column.name}.#{v}")
              end.compact.join(',<br />')
            when :url, "url" then
              link_to h(value), value.start_with?("http://") ? value : "http://#{value}"
            else
              value.blank? ? template.t(:blank, :scope => [:table_listing, :cell]) : h(value)
          end
          hidden << value
        end
      end # columns

      ## add hidden column
      diff = getHiddenColumnsView(grid, data, rowid)
      html << template.content_tag(:td, diff, :style => 'display: none;')

      if grid.respond_to?("getActions")
        actions = grid.getActions(data).collect do |action|
          tpath = action[:label].is_a?(::Symbol) ? "actions.#{action[:label]}" : action[:label] 
          
          url = action[:url] ? h(action[:url]) : '#'
          action[:options] ||= {}
          action[:options][:rowid] = rowid
          action[:options][:type] = action[:label]
          template.content_tag(:div, template.link_to(::Formtastic::I18n.t(tpath), url, action[:options]))
        end
        html << template.content_tag(:td, actions, {:class => "actions"})
      end
      html
    end
    
    def getHiddenColumns(grid)
      hiddenCols = []
      if grid.respond_to?("addForm") && grid.addForm != false
        addCols = []
        grid.addForm.class.columns.collect {|column| addCols << column.name}
        cols = []
        grid.class.columns.collect {|column| cols << column.name}
        (addCols - cols).collect {|col| hiddenCols << col}
      end
      hiddenCols
    end

    def getHiddenColumnsView(grid, data, rowid)
      out = ''
      getHiddenColumns(grid).collect do |col|
        column = grid.addForm.class.columns.select { |item| item.name == col }.first
        value = data[col]

        out <<
        case column.attrs[:as]
          when :checkboxes, "checkboxes" then
            value = [] if value.nil?
            
            value.collect do |v|
              template.hidden_field_tag([grid[:name], '[', rowid, '][', column.name, '][]'].join(''), v, :tpl => 1)
            end.compact.join('')
          when :comment, "comment" then
            ''
          else
            template.hidden_field_tag([grid[:name], '[', rowid, '][', column.name, ']'].join(''), value, :tpl => 1)
        end
      end
      out
    end
    
  end
end