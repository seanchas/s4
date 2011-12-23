module ApplicationHelper
  
  def title(title, title_visible = true)
    content_for(:title, title)
    @title_visible = title_visible
  end
  
  def title_present?
    !!@content_for_title
  end
  
  def title_visible?
    title_present? && @title_visible
  end
  
  def domains_menu
    current_url = "#{request.scheme}://#{request.host}"
    navigation.ul :html => { :class => "tabbed_menu left" } do |ul|
      t(:domains, :scope => [:shared, :headline]).each do |title, url|
        ul.li h(title), url, url == current_url ? :all : :none
      end
    end
  end

  def main_menu
    navigation.ul :html => { :class => :tabbed_menu } do |ul|
      ul.li t(:title, :scope => :welcome), organization_path, :organizations, :markets, :documents, :cards, :senddocuments, :authorities
      #ul.li t(:title, :scope => :insiders), insider_path, :insiders
      #ul.li t(:title, :scope => :reports),      reports_path,       :reports
    end 
  end
  
  def auxiliary_menu
  end
  
  def authentication_menu
    navigation.ul :html => { :class => "tabbed_menu authentication_menu alt_links" } do |ul|
      if authenticated?
        ul.li h(authenticated_user.screen_name),  Passport::profile_url, :html => { :class => :user }
        ul.li t(".logout"),                       Passport::logout_url + "?return_to=#{request.url}"
      else
        ul.li t(".login"),                        Passport::login_url + "?return_to=#{request.url}"
        ul.li t(".registration"),                 Passport::registration_url
      end
    end
  end

  def resource_table(schema, resources)
    reset_cycle
    content_tag(:table, :class => "resource") do
      [resource_table_schema(schema), resource_table_rows(schema, resources).join].join
    end
  end
  
  def resource_table_schema(schema)
    cells = schema.columns.collect { |column| content_tag(:td, column.title) }.join
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
          ""
      end
    end
  end
  
  
  def table_listing(schema, resources)
    reset_cycle
    content_tag(:table, :class => "resource") do
      [table_listing_schema(schema), table_listing_rows(schema, resources).join].join
    end
  end
  
  def table_listing_schema(schema)
    cells = schema.columns.collect { |column| content_tag(:td, column.title) }.join
    content_tag(:thead) do
      content_tag(:tr, cells)
    end
  end
  
  def table_listing_rows(schema, resources)
    resources.collect do |resource|
      content_tag(:tr, table_listing_cells(schema, resource).join, :class => cycle("odd", "even"))
    end
  end
  
  def table_listing_cells(schema, resource)
    schema.columns.collect do |column|
      table_listing_cell(column, resource)
    end
  end
  
  def table_listing_cell(column, resource)
    t_resource_value(:td, column, resource)
  end
  
  def t_resource_value(tag, column, resource)
    value = resource.try(column.name)
    content_tag(tag, :class => [column.type, column.nowrap? ? :nowrap : nil].compact.join(" ")) do
      case column.type
        when "string"
          value.blank? ? t(:blank, :scope => [:table_listing, :cell]) : h(value)
        when "date"
          l(value.to_date) rescue nil
        when "url"
          link_to h(value), value.start_with?("http://") ? value : "http://#{value}"
        when "file"
          value
        else
          ""
      end
    end
  end
  
end
