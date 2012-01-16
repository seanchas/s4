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
  
  def javascript_include_once(*args)
    @javascript_include_once ||= []
    args.collect do |n|
      unless @javascript_include_once.include?(n)
        @javascript_include_once << n
        content_for :js do
          javascript_include_tag n
        end
      end
    end
  end
  
  def stylesheet_include_once(*args)
    @stylesheet_include_once ||= []
    args.collect do |n|
      unless @stylesheet_include_once.include?(n)
        @stylesheet_include_once << n
        content_for :css do
          stylesheet_link_tag n
        end
      end
    end
  end
  
  def self.s4_user
    @s4_user
  end

  def self.s4_user=(s4_user)
    @s4_user = s4_user
  end

  def self.get_license_type(license_type)
    if !license_type.nil?
      S4::LicenceType.scope = {:licence_kind => license_type}
      self.parse_collection S4::LicenceType.all_with_scope(ApplicationHelper.s4_user)
    else
      self.parse_collection S4::LicenceType.all(ApplicationHelper.s4_user)
    end
  end
  
  def self.get_license_organ
    self.parse_collection S4::LicenceOrgan.all(ApplicationHelper.s4_user)
  end
  
  def self.get_alert_phone_category
    self.parse_collection S4::AlertPhoneCategory.all(ApplicationHelper.s4_user)
  end
  
  def self.get_country
    self.parse_collection S4::Country.all(ApplicationHelper.s4_user)
  end
  
private
  def self.parse_collection(v)
    collection = v.collect do |l|
      [l.attributes['name'], l.attributes['id']]
    end
    collection
  end
end
