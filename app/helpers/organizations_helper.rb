module OrganizationsHelper
  def contextual_menu
    javascript_include_once("dropdownmenu")
    stylesheet_include_once("dropdownmenu")
    
    arrow = content_tag :span, "&darr;", {:class => "dropdownmenu_arrow"}
    main_infoormation = [:reset, :show, :sendcard, :licenses, :ceo, :controllers, :controllersadd, :controllersedit, :structure, :capital, :ncc_federal_law, :filials, :phones, :contactlist]

    title = :information
    title = params[:action].to_sym if !main_infoormation.index(params[:action].to_sym).nil?
    title = :information if title == :show
    submenu = navigation.ul(:html => { :id => :organization_edit, :class => [:tabbed_menu, :level2].join(' ')} )do |ul|
      ul.li(t(:information, :scope => [:organizations, :contextual_menu]), organization_path,             :organizations => :show)
      #ul.li t(:sendcard, :scope => [:organizations, :contextual_menu]), sendcard_organization_path,             :organizations => :sendcard
      ul.li t(:licenses, :scope => [:organizations, :contextual_menu]), licenses_organization_path,             :organizations => :licenses
      ul.li t(:ceo, :scope => [:organizations, :contextual_menu]), ceo_organization_path,             :organizations => :ceo 
      ul.li t(:controllers, :scope => [:organizations, :contextual_menu]), controllers_organization_path,             :organizations => [:controllers, :controllersadd, :controllersedit]
      ul.li t(:structure, :scope => [:organizations, :contextual_menu]), structure_organization_path,             :organizations => :structure
      ul.li t(:capital, :scope => [:organizations, :contextual_menu]), capital_organization_path,             :organizations => :capital
      ul.li t(:ncc_federal_law, :scope => [:organizations, :contextual_menu]), ncc_federal_law_organization_path,             :organizations => :ncc_federal_law
      ul.li t(:filials, :scope => [:organizations, :contextual_menu]), filials_organization_path,             :organizations => :filials
      ul.li t(:phones, :scope => [:organizations, :contextual_menu]), phones_organization_path,             :organizations => :phones
      ul.li t(:contactlist, :scope => [:organizations, :contextual_menu]), contactlist_organization_path,             :organizations => :contactlist
      #ul.li t(:reset, :scope => [:organizations, :contextual_menu]), reset_organization_path,             :organizations => :reset
    end

    # main menu
    menu = navigation.ul :html => { :id => :contextual_menu, :class => [:tabbed_menu, :level1].join(' ')} do |ul|
      ul.li(t(title, :scope => [:organizations, :contextual_menu]), organization_path,             :organizations => main_infoormation)  do 
        arrow << submenu.to_s 
      end 
      #ul.li(t(:organization_edit, :scope => [:organizations, :contextual_menu]), sendcard_organization_path, :organizations => [:sendcard, :licenses, :ceo, :controllersadd, :controllersedit, :structure, :capital, :ncc_federal_law, :filials, :phones, :contactlist])
      ul.li t(:manager,     :scope => [:organizations, :contextual_menu]), manager_organization_path,     :organizations => :manager
      #ul.li t(:news,     :scope => [:organizations, :contextual_menu]), news_organization_path,     :organizations => :news
      ul.li t(:notice,     :scope => [:organizations, :contextual_menu]), notice_organization_path,     :organizations => :notice
      ul.li t(:messages,     :scope => [:organizations, :contextual_menu]), messages_organization_path,     :organizations => :messages
      ul.li t(:controldebt,     :scope => [:organizations, :contextual_menu]), controldebt_organization_path,     :organizations => :controldebt
    end
    
    content_tag :div, menu, {:id => "dropdownmenu"}
  end

  def convertForRowset(param)
    counter = 0
    conv = Array.new
    
    while counter < param.length
      conv.push( param[ counter ].attributes )
      counter = counter + 1
    end
    
    return conv
  end
  
  def ncc_federal_law_create(params)
    data = params[:ncc_federal_law]
    data[:user] = s4_user

    item_id = data[:id_item]
    if data[:id_item].is_numeric? && data[:id_item] != "0"
      NccFederalLaw.update(item_id, data)
    else
      row = NccFederalLaw.new(data)
      row.save
      item_id = row.id
    end
  
    ShellBankAcc.delete_all ["parent_id = ?", item_id]
    if data[:shell_bank_acc]
      data[:shell_bank_acc].each do |key,bnks|
        bnks[:parent_id] = item_id
        attest_info = ShellBankAcc.new(bnks)
        attest_info.save
      end
    end
  end
  
  
  def capital_add(params)
    params[:capital][:user] = s4_user
    
    if params[:capital][:id_item].is_numeric? && params[:capital][:id_item] != "0"
      item_id = params[:capital][:id_item]
      Capitals.update(item_id, params[:capital])
    else
      capitals = Capitals.new(params[:capital])
      capitals.save
      item_id = capitals.id
    end
  end
 
  def new_phone(params)
    
    ActiveRecord::Base.connection.execute("DELETE FROM `phones` WHERE `user` = '#{s4_user}'")
    
    data = {}
    data[:no_phone_valuta] = params[:no_phone_valuta]
    data[:no_phone_fondovii] = params[:no_phone_fondovii]
    data[:no_phone_srochnii] = params[:no_phone_srochnii]
    data[:no_phone_cenii] = params[:no_phone_cenii]
    UserCardsSyncS4.update_all(data, ["user = ?", s4_user])

    if params[:valuta]
      params[:valuta].each do |k,data|
        data[:kind] = 'valuta'
        data[:user] = s4_user
        phoneObject = Phones.new( data )
        phoneObject.save
      end
    end
    
    if params[:fondovii]
      params[:fondovii].each do |k,data|
        data[:kind] = 'fondovii'
        data[:user] = s4_user
        phoneObject = Phones.new( data )
        phoneObject.save
      end
    end
    
    if params[:srochnii]
      params[:srochnii].each do |k,data|
        data[:kind] = 'srochnii'
        data[:user] = s4_user
        phoneObject = Phones.new( data )
        phoneObject.save
      end
    end
    
    if params[:cenii]
      params[:cenii].each do |k,data|
        data[:kind] = 'cenii'
        data[:user] = s4_user
        phoneObject = Phones.new( data )
        phoneObject.save
      end
    end
    
  end
  
  def new_contact(params)
    
    ActiveRecord::Base.connection.execute("DELETE FROM `contacts` WHERE `user` = '#{s4_user}'")
    
    data = {}
    data[:no_contact_valuta] = params[:no_contact_valuta]
    data[:no_contact_fondovii] = params[:no_contact_fondovii]
    data[:no_contact_srochnii] = params[:no_contact_srochnii]
    data[:no_contact_cenii] = params[:no_contact_cenii]
    UserCardsSyncS4.update_all(data, ["user = ?", s4_user])

    if params[:cenii]
      params[:cenii].each do |k,data|
        data[:kind] = 'cenii'
        data[:user] = s4_user
        contactObject = Contacts.new( data )
        contactObject.save
      end
    end
    
    if params[:srochnii]
      params[:srochnii].each do |k,data|
        data[:kind] = 'srochnii'
        data[:user] = s4_user
        contactObject = Contacts.new( data )
        contactObject.save
      end
    end
    
    if params[:valuta]
      params[:valuta].each do |k,data|
        data[:kind] = 'valuta'
        data[:user] = s4_user
        contactObject = Contacts.new( data )
        contactObject.save
      end
    end
    
    if params[:fondovii]
      params[:fondovii].each do |k,data|
        data[:kind] = 'fondovii'
        data[:user] = s4_user
        contactObject = Contacts.new( data )
        contactObject.save
      end
    end
    
  end
  
  def ceo_create(params)
      params[:ceo][:user] = s4_user
    
      if params[:ceo][:id_item].is_numeric? && params[:ceo][:id_item] != "0"
        item_id = params[:ceo][:id_item]
        Ceo.update(item_id, params[:ceo])
        CeoAttestat.delete_all "parent_id = #{item_id}"
      else
        ceo = Ceo.new(params[:ceo])
        ceo.save
        item_id = ceo.id
      end
      
      if params[:ceo][:certificates]
        params[:ceo][:certificates].each do |key,data|
          data[:parent_id] = item_id
          
          if data[:qualification].class == Array
            data[:qualification] = data[:qualification].join(",")
            data[:qualification] = "[#{data[:qualification]}]"
          end
          
          if data[:activity].is_a?(::Array)
            data[:activity] = "[#{data[:activity].join(",")}]"
          end
          ceo_attestat = CeoAttestat.new(data)
          ceo_attestat.save
        end
      end
  end
  
  def licenses_save(params)
    delete_query = "DELETE FROM `licenses` WHERE `user` = '#{s4_user}'"
    ActiveRecord::Base.connection.execute( delete_query )
    
    if params[:banking]
      params[:banking].each do |k,data|
        data[:kind] = 'banking'
        data[:user] = s4_user
        licensesObject = Licenses.new( data )
        licensesObject.save
      end
    end
    
    if params[:professionalmember]
      params[:professionalmember].each do |k,data|
        data[:kind] = 'professionalmember'
        data[:user] = s4_user
        licensesObject = Licenses.new( data )
        licensesObject.save
      end
    end
    
    if params[:forwardmarket]
      params[:forwardmarket].each do |k,data|
        data[:kind] = 'forwardmarket'
        data[:user] = s4_user
        licensesObject = Licenses.new( data )
        licensesObject.save
      end
    end
    
    if params[:other]
      params[:other].each do |k,data|
        data[:kind] = 'other'
        data[:user] = s4_user
        licensesObject = Licenses.new( data )
        licensesObject.save
      end
    end
  end

  def controllersSave(data)
    if data[:id_item].is_numeric? && data[:id_item] != '0'
      controller = Controller.update(data[:id_item], data)
    else
      controller = Controller.new(data)
    end
    data.delete(:id_name)
    controller.save

    ControllersAttestat.delete_all(["parent_id = ?", controller.id])
    if data[:controllers]
      data[:controllers].each do |k,item|

        item[:parent_id] = controller.id
        if item[:qualification].is_a?(::Array)
          item[:qualification] = item[:qualification].join(",")
          item[:qualification] = "[#{item[:qualification]}]"
        end
        
        if item[:activity].is_a?(::Array)
          item[:activity] = item[:activity].join(",")
          item[:activity] = "[#{item[:activity]}]"
        end

        controllersObject = ControllersAttestat.new( item )
        controllersObject.save
      end
    end
  end
  
  def organizationSave(data)
    data[:user] = s4_user
    data.delete(:s4_id)

    item_id = data[:item_id]
    if data[:item_id].is_numeric? && data[:item_id] != "0"
      Organization.update(item_id, data)
    else 
      organizationRow = Organization.new(data)
      organizationRow.save
      item_id = organizationRow.id
    end
    
    
    Okved.delete_all ["parent_id = ?", item_id]
    if data[:okveds]
      data[:okveds].each do |key,value|
        okved = {
          :parent_id => item_id,
          :okved => value[:okved]
        }
        okvedRow = Okved.new(okved)
        okvedRow.save
      end
    end
  end
end
