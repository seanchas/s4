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
  
  def cache_key(key)
    "#{s4_user}_#{key}"
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
  
  def self.getRegCardSections
    [:ceo, :capital, :contactlist, :controllers, :filials, :licenses, :ncc_federal_law, :show, :phones, :sendcard, :structure]
  end

  def getErrors(to_save = nil)
    out = ""
    errorsXML = Rails.cache.fetch cache_key('cards.sendcard.reg_card_error')
    Rails.cache.delete cache_key('cards.sendcard.reg_card_error')
# errorsXML =<<-XTY
# <resources><resource type="error"><property name="template"><![CDATA[Поле "НАИМЕНОВАНИЕ ВЫСШЕГО ОРГАНА УПРАВЛЕНИЯ" должно быть заполнено.]]></property><fields><field><![CDATA[main_commitee_name]]></field></fields><property name="resource"><![CDATA[authority]]></property></resource><resource type="error"><property name="template"><![CDATA[Поле "НАИМЕНОВАНИЕ КОЛЛЕГИАЛЬНОГО ОРГАНА УПРАВЛЕНИЯ" должно быть заполнено.]]></property><fields><field><![CDATA[col_commitee_name]]></field></fields><property name="resource"><![CDATA[authority]]></property></resource><resource type="error"><property name="template"><![CDATA[Поле "ИМЯ РУКОВОДИТЕЛЯ КОЛЛЕГИАЛЬНОГО ОРГАНА УПРАВЛЕНИЯ" должно быть заполнено.]]></property><fields><field><![CDATA[board_firstname]]></field></fields><property name="resource"><![CDATA[directors_committee_head]]></property></resource><resource type="error"><property name="template"><![CDATA[Поле "ОТЧЕСТВО РУКОВОДИТЕЛЯ КОЛЛЕГИАЛЬНОГО ОРГАНА УПРАВЛЕНИЯ" должно быть заполнено.]]></property><fields><field><![CDATA[board_patronymic]]></field></fields><property name="resource"><![CDATA[directors_committee_head]]></property></resource><resource type="error"><property name="template"><![CDATA[В списке "СОСТАВ КОЛЛЕГИАЛЬНОГО ОРГАНА УПРАВЛЕНИЯ" нет ни одной записи и отметка ОТСУТСТВУЮТ не установлена. Необходимо либо заполнить список, либо установить отметку ОТСУТСТВУЮТ]]></property><fields></fields><property name="resource"><![CDATA[directors_committee]]></property></resource><resource type="error"><property name="template"><![CDATA[Поле "НАИМЕНОВАНИЕ КОЛЛЕГИАЛЬНОГО ИСПОЛНИТЕЛЬНОГО ОРГАНА УПРАВЛЕНИЯ" должно быть заполнено.]]></property><fields><field><![CDATA[executive_commitee_name]]></field></fields><property name="resource"><![CDATA[authority]]></property></resource><resource type="error"><property name="template"><![CDATA[В списке "СОСТАВ КОЛЛЕГИАЛЬНОГО ИСПОЛНИТЕЛЬНОГО ОРГАНА УПРАВЛЕНИЯ" нет ни одной записи и отметка ОТСУТСТВУЮТ не установлена. Необходимо либо заполнить список, либо установить отметку ОТСУТСТВУЮТ]]></property><fields></fields><property name="resource"><![CDATA[direction]]></property></resource><resource type="error"><property name="template"><![CDATA[Необходимо заполнить поля: "Сведения по присутствии или отсутствии по своему местонахождению юр. лица, его постоянно действующего органа управления"]]></property><fields><field><![CDATA[organs_place_other]]></field></fields><property name="resource"><![CDATA[ceo]]></property></resource><resource type="error"><property name="template"><![CDATA[Поле "Величина зарегистрированного и оплаченного уставного (складочного) капитала" должно быть заполнено.]]></property><fields><field><![CDATA[auth_capital_vol]]></field></fields><property name="resource"><![CDATA[capital_data]]></property></resource><resource type="error"><property name="template"><![CDATA[Поле "Величина зарегистрированного и оплаченного уставного (складочного) капитала прописью" должно быть заполнено.]]></property><fields><field><![CDATA[auth_capital_vollit]]></field></fields><property name="resource"><![CDATA[capital_data]]></property></resource><resource type="error"><property name="template"><![CDATA[Поле "Величина частично оплаченного уставного (складочного) капитала" должно быть заполнено.]]></property><fields><field><![CDATA[unpaid_auth_capital_vol]]></field></fields><property name="resource"><![CDATA[capital_data]]></property></resource><resource type="error"><property name="template"><![CDATA[Поле "Величина частично оплаченного уставного (складочного) капитала прописью" должно быть заполнено.]]></property><fields><field><![CDATA[unpaid_auth_capital_vollit]]></field></fields><property name="resource"><![CDATA[capital_data]]></property></resource><resource type="error"><property name="template"><![CDATA[Необходимо указать "Сведения о наличии (отсутствии) корреспондентских счетов, открытых  в банках государств, о  которых известно, что они не соблюдают общепринятых стандартов в борьбе с легализацией (отмыванием)  доходов, полученных преступным путем..."]]></property><fields><field><![CDATA[corr_acc_corr_countr]]></field></fields><property name="resource"><![CDATA[ncc_federal_law]]></property></resource><resource type="error"><property name="template"><![CDATA[Необходимо указать "Сведения о наличии (отсутствии) корреспондентских счетов, открытых  в банках государств - оффшорных зон..."]]></property><fields><field><![CDATA[corr_acc_offshore]]></field></fields><property name="resource"><![CDATA[ncc_federal_law]]></property></resource><resource type="error"><property name="template"><![CDATA[Необходимо указать "Сведения о наличии (отсутствии) корреспондентских счетов, открытых  в банках государств, о которых известно, что в них незаконно производятся или переправляются наркотические вещества, а также государств, разрешающих свободный оборот наркотических веществ..."]]></property><fields><field><![CDATA[corr_acc_drug]]></field></fields><property name="resource"><![CDATA[ncc_federal_law]]></property></resource><resource type="error"><property name="template"><![CDATA[В строке 1 списка Лица для оперативного взаимодействия на фондовом рынке не указан код города для телефона]]></property><fields><field><![CDATA[phone_areacode]]></field></fields><property name="resource"><![CDATA[contact]]></property></resource><resource type="error"><property name="template"><![CDATA[В строке 2 списка Лица для оперативного взаимодействия на фондовом рынке не указан код города для телефона]]></property><fields><field><![CDATA[phone_areacode]]></field></fields><property name="resource"><![CDATA[contact]]></property></resource><resource type="error"><property name="template"><![CDATA[В строке 3 списка Лица для оперативного взаимодействия на фондовом рынке не указан код города для телефона]]></property><fields><field><![CDATA[phone_areacode]]></field></fields><property name="resource"><![CDATA[contact]]></property></resource><resource type="error"><property name="template"><![CDATA[В строке 4 списка Лица для оперативного взаимодействия на фондовом рынке не указан код города для телефона]]></property><fields><field><![CDATA[phone_areacode]]></field></fields><property name="resource"><![CDATA[contact]]></property></resource><resource type="error"><property name="template"><![CDATA[В строке 5 списка Лица для оперативного взаимодействия на фондовом рынке не указан код города для телефона]]></property><fields><field><![CDATA[phone_areacode]]></field></fields><property name="resource"><![CDATA[contact]]></property></resource><resource type="error"><property name="template"><![CDATA[В строке 6 списка Лица для оперативного взаимодействия на фондовом рынке не указан код города для телефона]]></property><fields><field><![CDATA[phone_areacode]]></field></fields><property name="resource"><![CDATA[contact]]></property></resource><resource type="error"><property name="template"><![CDATA[В строке 7 списка Лица для оперативного взаимодействия на фондовом рынке не указан код города для телефона]]></property><fields><field><![CDATA[phone_areacode]]></field></fields><property name="resource"><![CDATA[contact]]></property></resource><resource type="error"><property name="template"><![CDATA[В строке 8 списка Лица для оперативного взаимодействия на фондовом рынке не указан код города для телефона]]></property><fields><field><![CDATA[phone_areacode]]></field></fields><property name="resource"><![CDATA[contact]]></property></resource><resource type="error"><property name="template"><![CDATA[В строке 1 списка Лица для оперативного взаимодействия на фондовом рынке неправильно указан номер телефона, номер должен содержать только цифры]]></property><fields><field><![CDATA[phone]]></field></fields><property name="resource"><![CDATA[contact]]></property></resource><resource type="error"><property name="template"><![CDATA[В строке 1 списка Лица для оперативного взаимодействия на срочном рынке MICEX не указан код города для телефона]]></property><fields><field><![CDATA[phone_areacode]]></field></fields><property name="resource"><![CDATA[contact]]></property></resource><resource type="error"><property name="template"><![CDATA[В строке 2 списка Лица для оперативного взаимодействия на срочном рынке MICEX не указан код города для телефона]]></property><fields><field><![CDATA[phone_areacode]]></field></fields><property name="resource"><![CDATA[contact]]></property></resource><resource type="error"><property name="template"><![CDATA[В строке 3 списка Лица для оперативного взаимодействия на срочном рынке MICEX не указан код города для телефона]]></property><fields><field><![CDATA[phone_areacode]]></field></fields><property name="resource"><![CDATA[contact]]></property></resource><resource type="error"><property name="template"><![CDATA[В строке 4 списка Лица для оперативного взаимодействия на срочном рынке MICEX не указан код города для телефона]]></property><fields><field><![CDATA[phone_areacode]]></field></fields><property name="resource"><![CDATA[contact]]></property></resource><resource type="error"><property name="template"><![CDATA[В строке 5 списка Лица для оперативного взаимодействия на срочном рынке MICEX не указан код города для телефона]]></property><fields><field><![CDATA[phone_areacode]]></field></fields><property name="resource"><![CDATA[contact]]></property></resource><resource type="error"><property name="template"><![CDATA[В строке 1 списка Лица для оперативного взаимодействия на валютном рынке не указан код города для телефона]]></property><fields><field><![CDATA[phone_areacode]]></field></fields><property name="resource"><![CDATA[contact]]></property></resource><resource type="error"><property name="template"><![CDATA[В строке 2 списка Лица для оперативного взаимодействия на валютном рынке не указан код города для телефона]]></property><fields><field><![CDATA[phone_areacode]]></field></fields><property name="resource"><![CDATA[contact]]></property></resource><resource type="error"><property name="template"><![CDATA[В строке 3 списка Лица для оперативного взаимодействия на валютном рынке не указан код города для телефона]]></property><fields><field><![CDATA[phone_areacode]]></field></fields><property name="resource"><![CDATA[contact]]></property></resource><resource type="error"><property name="template"><![CDATA[В строке 4 списка Лица для оперативного взаимодействия на валютном рынке не указан код города для телефона]]></property><fields><field><![CDATA[phone_areacode]]></field></fields><property name="resource"><![CDATA[contact]]></property></resource><resource type="error"><property name="template"><![CDATA[В строке 5 списка Лица для оперативного взаимодействия на валютном рынке не указан код города для телефона]]></property><fields><field><![CDATA[phone_areacode]]></field></fields><property name="resource"><![CDATA[contact]]></property></resource><resource type="error"><property name="template"><![CDATA[В строке 1 списка Лица для оперативного взаимодействия на рынке гцб не указан код города для телефона]]></property><fields><field><![CDATA[phone_areacode]]></field></fields><property name="resource"><![CDATA[contact]]></property></resource><resource type="error"><property name="template"><![CDATA[В строке 2 списка Лица для оперативного взаимодействия на рынке гцб не указан код города для телефона]]></property><fields><field><![CDATA[phone_areacode]]></field></fields><property name="resource"><![CDATA[contact]]></property></resource><resource type="error"><property name="template"><![CDATA[В строке 3 списка Лица для оперативного взаимодействия на рынке гцб не указан код города для телефона]]></property><fields><field><![CDATA[phone_areacode]]></field></fields><property name="resource"><![CDATA[contact]]></property></resource><resource type="error"><property name="template"><![CDATA[В строке 4 списка Лица для оперативного взаимодействия на рынке гцб не указан код города для телефона]]></property><fields><field><![CDATA[phone_areacode]]></field></fields><property name="resource"><![CDATA[contact]]></property></resource><resource type="error"><property name="template"><![CDATA[В строке 5 списка Лица для оперативного взаимодействия на рынке гцб не указан код города для телефона]]></property><fields><field><![CDATA[phone_areacode]]></field></fields><property name="resource"><![CDATA[contact]]></property></resource><resource type="error"><property name="template"><![CDATA[В строке 6 списка Лица для оперативного взаимодействия на рынке гцб не указан код города для телефона]]></property><fields><field><![CDATA[phone_areacode]]></field></fields><property name="resource"><![CDATA[contact]]></property></resource><resource type="error"><property name="template"><![CDATA[В строке 7 списка Лица для оперативного взаимодействия на рынке гцб не указан код города для телефона]]></property><fields><field><![CDATA[phone_areacode]]></field></fields><property name="resource"><![CDATA[contact]]></property></resource><resource type="error"><property name="template"><![CDATA[В строке 8 списка Лица для оперативного взаимодействия на рынке гцб не указан код города для телефона]]></property><fields><field><![CDATA[phone_areacode]]></field></fields><property name="resource"><![CDATA[contact]]></property></resource><resource type="error"><property name="template"><![CDATA[Не заполнены сведения о Московском филиале (представительстве) и не установлена отметка об отсутствии филиала (представительства). Необходимо либо заполнить все поля, либо поставить отметку МОСКОВСКИЙ ФИЛИАЛ (ПРЕДСТАВИТЕЛЬСТВО) ОТСУТСТВУЕТ]]></property><fields><field><![CDATA[no_moscow]]></field></fields><property name="resource"><![CDATA[filial_info]]></property></resource><resource type="error"><property name="template"><![CDATA[Поле "КОЛИЧЕСТВО ФИЛИАЛОВ" должно быть заполнено.]]></property><fields><field><![CDATA[filial_num]]></field></fields><property name="resource"><![CDATA[filial_info]]></property></resource></resources>
# XTY

    errors = {}
    if !errorsXML.nil? && errorsXML != ""
      doc = Nokogiri::XML(errorsXML)
      list = doc.xpath('//resource[@type="error"]')
      list.collect do |item|
        template = resource = nil
        node = item.xpath('./property[@name="template"]').first
        template = node.text if !node.nil?
        
        node = item.xpath('./property[@name="resource"]').first
        resource = node.text if !node.nil?
        
        fields = item.xpath('./property[@name="fiends"]')
        rs = getGroupByResourceName(resource)
        if to_save.nil? | (!to_save.nil? && !to_save.index(resource.to_sym).nil?)
          errors[rs.to_sym] ||= []
          errors[rs.to_sym] << template
        end
      end
      resources = errors.map {|a, b| a}
  
      errors = prepareRegCardErrorsToDb(errors)
      errors[:user] = s4_user
      if data = RegCardErrors.find_by_user(s4_user)
        RegCardErrors.update_all(errors, {:user => s4_user})
      else
        row = RegCardErrors.new(errors)
        row.save
      end

      row = RegCardErrors.find_by_user(s4_user)

      row.attributes.symbolize_keys.each do |k, v|
        if [:common_errors, :user, :id].include?(k)
          next
        end
        data = JSON.parse(row[k]) rescue ''
        out << getErrorsHtml(k.to_sym, data, false) if !v.nil?
      end
      RegCardErrors.update_all({:common_errors => out}, {:user => s4_user})
    else
      row = RegCardErrors.find_by_user s4_user
      out = row.common_errors if !row.nil?
    end
    out
  end

  def prepareRegCardErrorsToDb(errors)
    out = {}
    errors.collect do |k,v|
      out[k] = v.to_json
    end
    out
  end

  def getGroupByResourceName name
    rs = <<-RTF
<ress>
    <res type="show">
    <s>organization</s>
    <s>okved</s>
    </res>

    <res type="licenses">
    <s>licence_organ</s>
    <s>licence</s>
    </res>
    
    <res type="ceo">
    <s>ceo</s>
    <s>ceo_attestat</s>
    <s>attestat</s>
    </res>
    
    <res type="controllers">
    <s>controller</s>
    <s>controller_attestat</s>
    <s>signer</s>
    </res>
    
    <res type="structure">
    <s>shareholder</s>
    <s>authority</s>
    <s>directors_committee_head</s>
    <s>directors_committee</s>
    <s>direction</s>
    </res>
    
    <res type="capital">
    <s>capital_data</s>
    <s>indirect_owner</s>
    <s>profiter_contract</s>
    </res>
    
    <res type="filials">
    <s>filial_info</s>
    </res>
    
    <res type="ncc_federal_law">
    <s>ncc_federal_law</s>
    <s>shell_bank_acc</s>
    </res>
    
    <res type="phones">
    <s>alert_phone</s>
    <s>alert_phone_category</s>
    <s>country</s>
    </res>
    
    <res type="sendcard">
    <s>reg_card_executor</s>
    </res>
    
    <res type="contactlist">
    <s>contact_group</s>
    <s>contact</s>
    </res></ress>
RTF
    doc = Nokogiri::XML::parse rs
    el = doc.xpath("//res/s[.='#{name}']").first
    el.parent.attribute('type').value if !el.nil?
  end

  def getErrorsHtml(resource, errors, autoshow)
    show_message = t(:show_errors, :scope => [:cards, :sendcard])
    hide_message = t(:hide_errors, :scope => [:cards, :sendcard])

    resourceHref = (resource == :show ? '/organization/' : "/organization/#{resource.to_s}/")
    resourceHref = "/cards/sendcard/" if resource == :sendcard

    builder = Nokogiri::XML::Builder.new do |xml|
      xml.div(:class => :reg_card_resource) {
        xml.h3 "#{::I18n.t(resource.to_sym, :scope => [:organizations, :contextual_menu])}" do
          xml.div {
            xml.span ::I18n.t(:count_errors, :scope => [:cards, :sendcard]) % [errors.length]
            xml.a(::I18n.t(:goto_resource, :scope => [:cards, :sendcard]), :href => resourceHref, :class => :goto_resource)
            
            xml.a((autoshow ? hide_message : show_message), :href => '#', :class => :show_errors)
          }
        end


        xml.div {
          xml.ul {
            xml.li(:style => "display: #{(autoshow ? 'block': 'none')}" , :class => :all_errors, :hide_message => hide_message, :show_message => show_message) {
              xml.ul {
                errors.each do |item|
                  xml.li :li, item
                end
              }
            }
          }
        }
      }
    end
    builder.doc.xpath('/div').to_xml
  end
  
  def getTranslations(fields, resource)
    out = []
    fields.collect do |item|
      out << ["%#{item.text}%", t(item.text.to_sym, :scope => [:formtastic, :labels, :cards, resource.to_sym])]
    end
    out
  end
end
