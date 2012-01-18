module OrganizationsHelper
  def contextual_menu
    javascript_include_once("dropdownmenu")
    stylesheet_include_once("dropdownmenu")
    
    arrow = content_tag :span, "&darr;", {:class => "dropdownmenu_arrow"}

    submenu = navigation.ul(:html => { :id => :organization_edit, :class => [:tabbed_menu, :level2].join(' ')} )do |ul|
      ul.li t(:sendcard, :scope => [:organizations, :contextual_menu]), sendcard_organization_path,             :organizations => :sendcard
      ul.li t(:licenses, :scope => [:organizations, :contextual_menu]), licenses_organization_path,             :organizations => :licenses
      ul.li t(:ceo, :scope => [:organizations, :contextual_menu]), ceo_organization_path,             :organizations => [:ceo, :controllersadd, :controllersedit] 
      ul.li t(:structure, :scope => [:organizations, :contextual_menu]), structure_organization_path,             :organizations => :structure
      ul.li t(:capital, :scope => [:organizations, :contextual_menu]), capital_organization_path,             :organizations => :capital
      ul.li t(:ncc_federal_law, :scope => [:organizations, :contextual_menu]), ncc_federal_law_organization_path,             :organizations => :ncc_federal_law
      ul.li t(:filials, :scope => [:organizations, :contextual_menu]), filials_organization_path,             :organizations => :filials
      ul.li t(:phones, :scope => [:organizations, :contextual_menu]), phones_organization_path,             :organizations => :phones
      ul.li t(:contactlist, :scope => [:organizations, :contextual_menu]), contactlist_organization_path,             :organizations => :contactlist
    end

    # main menu
    menu = navigation.ul :html => { :id => :contextual_menu, :class => [:tabbed_menu, :level1].join(' ')} do |ul|
      ul.li t(:information, :scope => [:organizations, :contextual_menu]), organization_path,             :organizations => :show 
      ul.li(t(:organization_edit, :scope => [:organizations, :contextual_menu]), sendcard_organization_path, :organizations => [:sendcard, :licenses, :ceo, :controllersadd, :controllersedit, :structure, :capital, :ncc_federal_law, :filials, :phones, :contactlist]) do 
        arrow << submenu.to_s 
      end
      ul.li t(:manager,     :scope => [:organizations, :contextual_menu]), manager_organization_path,     :organizations => :manager
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
    params[:ncc_federal_law][:user] = s4_user

    if !params[:ncc_federal_law][:id_item].nil? && params[:ncc_federal_law][:id_item] != "0"
      item_id = params[:ncc_federal_law][:id_item]
      NccFederalLaw.update(item_id, params[:ncc_federal_law])
  
  
      ShellBankAcc.delete_all "parent_id = #{item_id}"
    else
      ncc_federal_law = NccFederalLaw.new(params[:ncc_federal_law])
      ncc_federal_law.save
      item_id = ncc_federal_law.id
    end
  
    if params[:ncc_federal_law][:shell_bank_acc]
      params[:ncc_federal_law][:shell_bank_acc].each do |key,data|
        data[:parent_id] = item_id
        attest_info = ShellBankAcc.new(data)
        attest_info.save
      end
    end    
  end
  
  
  def capital_add(params)
    params[:capital][:user] = s4_user
    
    if params[:capital][:id_item].is_numeric? && params[:capital][:id_item] != "0"
      item_id = params[:capital][:id_item]
      Capitals.update(item_id, params[:capital])
      
      #delete_query_contr = "DELETE FROM `lica_capitals` WHERE `parent_id` = #{item_id}"
      #ActiveRecord::Base.connection.execute( delete_query_contr )
      IndirectOwner.delete_all "parent_id = #{item_id}"
      
      #delete_query_v = "DELETE FROM `vigodnopreobretatels` WHERE `parent_id` = #{item_id}"
      #ActiveRecord::Base.connection.execute( delete_query_v )
      ProfiterContract.delete_all "parent_id = #{item_id}"
    else
      capitals = Capitals.new(params[:capital])
      capitals.save
      item_id = capitals.id
    end
    
    if params[:capital][:indirect_owner]
      params[:capital][:indirect_owner].each do |key,data|
        data[:parent_id] = item_id
        indirect_owner = IndirectOwner.new(data)
        indirect_owner.save
      end
    end
    
    if params[:capital][:profiter_contract]
      params[:capital][:profiter_contract].each do |key,data|
        data[:parent_id] = item_id
        profiter_contract = ProfiterContract.new(data)
        profiter_contract.save
      end
    end
  end
 
  def new_phone(params)
    
    ActiveRecord::Base.connection.execute("DELETE FROM `phones` WHERE `user` = '#{s4_user}'")
    
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
  
        #delete_query = "DELETE FROM `admins_attestats` WHERE `parent_id` = #{item_id}"
        #ActiveRecord::Base.connection.execute( delete_query )
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
  
  
  def filialsadd()
    
  end
  
  def controllersSave(data)
    if data[:id_item].is_numeric? && data[:id_item] != '0'
      controller = Controllers.update(data[:id_item], data)
    else
      controller = Controllers.new(data)
    end
    data.delete(:id_name)
    controller.save

    ControllersAttestats.delete_all(["parent_id = ?", controller.id])
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

        controllersObject = ControllersAttestats.new( item )
        controllersObject.save
      end
    end
  end
  
  def send_card(sendcardData)
    row = RegCardExecutor.new(sendcardData)
    doc = Nokogiri::XML::parse S4::RegCardExecutor.get_xml(s4_user)
    row.s4_id = doc.xpath('//property[@name="id"]').first.content
    row.user = s4_user

    regCardExecutorXML = S4::RegCardExecutor.create_xml(row)
    
    organizationXML = getOrganizationXML
    
    licensesRow = Licenses.find_all_by_user(s4_user)
    licensesXML = S4::License.create_xml(licensesRow)
    
    # authority
    authorityRow = Structures.find_by_user(s4_user)
    authorityXML = S4::Authority.create_xml(authorityRow)
    
    directorsCommitteeHeadXML = S4::DirectorsCommitteeHead.create_xml(authorityRow)
    
    shareHolderRowset = Struktures_shareholder.find_all_by_parent_id(authorityRow.id)
    shareHolderXML = S4::Shareholder.create_xml(shareHolderRowset)
    
    directorsCommitteeRowset = Struktures_Controls.find_all_by_parent_id_and_gridname(authorityRow.id, 'directors_committee')
    directorsCommitteeXML = S4::DirectorsCommittee.create_xml(directorsCommitteeRowset)
    
    directionRowset = [] 
    directionRowset = Struktures_Controls.find_all_by_parent_id_and_gridname(authorityRow.id, 'direction') if authorityRow.no_executive_commitee != true
    directionXML = S4::DirectorsCommittee.create_xml(directionRowset)
    
    #ceo
    ceoRow = Ceo.find_by_user(s4_user)
    ceoXML = S4::CEO.create_xml(ceoRow)

    # capital
    capitalDataRow = Capitals.find_by_user(s4_user)
    capitalDataXML = S4::CapitalData.create_xml(capitalDataRow)
    
    indirectOwnerRowset = [] 
    indirectOwnerRowset = IndirectOwner.find_all_by_parent_id(capitalDataRow.id) if capitalDataRow.no_indirect_owners != true
    indirectOwnerXML = S4::IndirectOwner.create_xml(indirectOwnerRowset)
    
    profiterContractRowset = []
    profiterContractRowset = ProfiterContract.find_all_by_parent_id(capitalDataRow.id) if capitalDataRow.no_ncc_profiters != true
    profiterContractXML = S4::ProfiterContract.create_xml(profiterContractRowset)

    # ncc_federal_law
    nccFederalLawRow = NccFederalLaw.find_by_user(s4_user)
    nccFederalLawXML = S4::NccFederalLaw.create_xml(nccFederalLawRow)
    shellBankAccRowset = []
    shellBankAccRowset = ShellBankAcc.find_all_by_parent_id(nccFederalLawRow.id) if nccFederalLawRow.no_shell_bank_acc != true
    shellBankAccXML = S4::ShellBankAcc.create_xml(shellBankAccRowset)

    
    # filials
    filialInfoRow = FilialInfo.find_by_user(s4_user)
    filialInfoXML = S4::FilialInfo.create_xml(filialInfoRow)

    # contact
    contactRowset = Contacts.find_all_by_user(s4_user)
    contactXML = S4::Contact.create_xml(contactRowset)

    S4::Card.scope = {
      :licence => licensesXML,
      :organization => organizationXML,
      
      :authority => authorityXML,
      :directors_committee_head => directorsCommitteeHeadXML,
      :shareholder => shareHolderXML,
      :directors_committee => directorsCommitteeXML,
      :direction => directionXML,
      
      :ceo => ceoXML,
      :capital_data => capitalDataXML,

      :indirect_owner => indirectOwnerXML,
      :profiter_contract => profiterContractXML,
      :ncc_federal_law => nccFederalLawXML,
      :shell_bank_acc => shellBankAccXML,
      :filial_info => filialInfoXML,
      :contact => contactXML,
      :reg_card_executor => regCardExecutorXML
    }

    data =""
    data = S4::Card.set_with_scope_xml(s4_user)
    data
  end
  
  
  def getOrganizationXML
    organizationDoc = Nokogiri::XML::parse S4::Organization.get_xml(s4_user)
    emptyProperties = organizationDoc.xpath('//resource/property[.=""]')
    emptyProperties.collect do |prop|
      prop['disabled'] = "true"
    end
    "<resources>#{organizationDoc.xpath('//resource').to_s}</resources>"
  end
end
