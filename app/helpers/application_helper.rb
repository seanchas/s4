module ApplicationHelper
  
  def main_menu
    navigation.ul :html => { :class => :tabbed_menu } do |ul|
      ul.li t(:title, :scope => :organizations), organization_path, :organizations
      ul.li t(:title, :scope => :markets),      markets_path,       :markets
      ul.li t(:title, :scope => :documents),    documents_path,     :documents
    end
  end
  
  def resource_table(schema, resources)
    reset_cycle
    content_tag(:table, :class => "resource") do
      [resource_table_schema(schema), resource_table_rows(schema, resources).join].join
    end
  end
  
  def resource_table_schema(schema)
    cells = schema.columns.collect { |column| puts column; content_tag(:td, column.title) }.join
    content_tag(:thead) do
      content_tag(:tr, cells)
    end
  end
  
  def resource_table_rows(schema, resources)
    resources.collect do |resource|
      content_tag(:tr, resource_table_cells(schema, resource).join, :class => cycle("odd", "even"))
    end
  end
  
  def resource_table_cells(schema, resource)
    schema.columns.collect do |column|
      resource_table_cell(column, resource)
    end
  end
  
  def resource_table_cell(column, resource)
    resource_value(:td, column, resource)
  end
  
  def resource_value(tag, column, resource)
    value = resource.try(column.name)
    content_tag(tag, :class => [column.type, column.nowrap? ? :nowrap : nil].compact.join(" ")) do
      case column.type
        when "string"
          value.blank? ? t(:blank, :scope => [:resource_table, :cell]) : h(value)
        when "date"
          l(value.to_date) rescue nil
        when "url"
          link_to h(value), value.start_with?("http://") ? value : "http://#{value}"
        else
          "unknown"
      end
    end
  end
  
end
