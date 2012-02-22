class UserCardsSyncS4 < ActiveRecord::Base
  attr_accessible :user, :form_edited
  
  def self.sync(s4_user, section = nil)

    case section
      when :ceo, 'ceo' then
        Ceo.destroy_all ["user = ?", s4_user]
      when :capital, 'capital' then
        Capitals.destroy_all ["user = ?", s4_user]
      when :contactlist, 'contactlist' then
        Contacts.destroy_all ["user = ?", s4_user]
        UserCardsSyncS4.update_all({
          :no_contact_valuta => nil,
          :no_contact_fondovii => nil,
          :no_contact_srochnii => nil,
          :no_contact_cenii => nil
        }, ["user = ?", s4_user])
      when :controllers, 'controllers' then
        Controller.destroy_all ["user = ?", s4_user]
      when :filials, 'filials' then
        FilialInfo.destroy_all ["user = ?", s4_user]
      when :licenses, 'licenses' then
        Licenses.destroy_all ["user = ?", s4_user]
      when :ncc_federal_law, 'ncc_federal_law' then
        NccFederalLaw.destroy_all ["user = ?", s4_user]
      when :show, 'show' then
        Organization.destroy_all ["user = ?", s4_user]
      when :phones, 'phones' then
        Phones.destroy_all ["user = ?", s4_user]
        UserCardsSyncS4.update_all({
          :no_phone_valuta => nil,
          :no_phone_fondovii => nil,
          :no_phone_srochnii => nil,
          :no_phone_cenii => nil
        }, ["user = ?", s4_user])
      when :sendcard, 'sendcard'
        RegCardExecutor.destroy_all ["user = ?", s4_user]
      when :structure, 'structure' then
        Structure.destroy_all ["user = ?", s4_user]
      when nil then
        Ceo.destroy_all ["user = ?", s4_user]
        Capitals.destroy_all ["user = ?", s4_user]
        Contacts.destroy_all ["user = ?", s4_user]
        Controller.destroy_all ["user = ?", s4_user]
        FilialInfo.destroy_all ["user = ?", s4_user]
        Licenses.destroy_all ["user = ?", s4_user]
        NccFederalLaw.destroy_all ["user = ?", s4_user]
        Organization.destroy_all ["user = ?", s4_user]
        Phones.destroy_all ["user = ?", s4_user]
        RegCardExecutor.destroy_all ["user = ?", s4_user]
        Structure.destroy_all ["user = ?", s4_user]
        UserCardsSyncS4.update_all({
          :no_contact_valuta => nil,
          :no_contact_fondovii => nil, 
          :no_contact_srochnii => nil, 
          :no_contact_cenii => nil,
          :no_phone_valuta => nil,
          :no_phone_fondovii => nil, 
          :no_phone_srochnii => nil, 
          :no_phone_cenii => nil,
        }, ["user = ?", s4_user])
        
      end
    if section.nil?
      # after fully updates (sync once)
      UserCardsSyncS4.destroy_all ["user = ?", s4_user]
      UserCardsSyncS4.new({:user => s4_user}).save
  
      self.organization_sync(s4_user)
      self.licenses_sync(s4_user)
      self.ceo_sync(s4_user)
      self.controllers_sync(s4_user)
      self.structure_sync(s4_user)
      self.capital_sync(s4_user)
      self.ncc_federal_law_sync(s4_user)
      self.filials_sync(s4_user)
      self.contactlist_sync(s4_user)
      self.phones_sync(s4_user)
      self.reg_card_executor_sync(s4_user)
    else

      data = {}
      data[section.to_sym] = nil
      RegCardErrors.update_all data, ["user = ?", s4_user]
      UserCardsSyncS4.update_all data, ["user = ?", s4_user]

      data = {}
      data[:card_edited] = (self.getNumberOfEditedSection(s4_user) > 0)
      UserCardsSyncS4.update_all data, ["user = ?", s4_user]

      section = :organization if section.to_sym == :show
      send(:"#{section}_sync", s4_user)
    end
  end
  
private
  def self.getNumberOfEditedSection(s4_user)
    out = 0
    sections = ApplicationHelper.getRegCardSections
    rowset = UserCardsSyncS4.find :all,
      :select => {"(IFNULL(`#{sections.join('`, 0) + IFNULL(`')}`, 0))" => :cnt},
      :conditions => ['user = ?', s4_user]
    row = rowset.first
    if !row.nil?
      out = row.cnt
    end
    out.to_i
  end

  # Контактные лица (5.9)
  def self.contactlist_sync(s4_user)
    contactGroup = S4::ContactGroup.all(s4_user)
    contactsDoc = Nokogiri::XML::parse S4::Contact.get_xml(s4_user)
    contacts = S4::Contact.all(s4_user)

    contacts.collect do |contact|
      data = contact.attributes.symbolize_keys
      
      recource = contactsDoc.xpath('//resource/property[@name="id" and .="' << data[:id] << '"]/parent::resource').first
      contact_group = nil
      contact_group = recource.xpath('./property[@name="contact_group"]').attribute('ref_id').value if !recource.nil?
      data[:kind] = S4::ContactGroup.getKindById(contact_group)
      data[:user] = s4_user

      data.delete(:contact_group)
      data.delete(:id)
      row = Contacts.new(data)
      row.save
    end
  end

  # Телефоны СОИ (5.8)
  def self.phones_sync(s4_user)
    phones = S4::AlertPhone.all(s4_user)
    phonesDoc = Nokogiri::XML::parse S4::AlertPhone.get_xml(s4_user)

    phones.collect do |phone|
      data = phone.attributes.symbolize_keys
      data[:user] = s4_user

      recource = phonesDoc.xpath('//resource/property[@name="id" and .="' << data[:id] << '"]/parent::resource').first

      contact_group = nil
      contact_group = recource.xpath('./property[@name="contact_group"]').attribute('ref_id').value if !recource.nil?
      data[:kind] = S4::ContactGroup.getKindById(contact_group)

      country = nil
      country = recource.xpath('./property[@name="country"]').attribute('ref_id').value if !recource.nil?
      data[:country] = country

      alert_phone_category = nil
      alert_phone_category = recource.xpath('./property[@name="alert_phone_category"]').attribute('ref_id').value if !recource.nil?
      data[:alert_phone_category] = alert_phone_category

      data.delete(:contact_group)
      data.delete(:id)
      row = Phones.new(data)
      row.save
    end
  end

  # Филиалы (5.7)
  def self.filials_sync(s4_user)
    filialInfo = S4::FilialInfo.all(s4_user)
    data = filialInfo.first.attributes.symbolize_keys
    data[:s4_id] = data[:id]
    data[:user] = s4_user
    data.delete(:id)
    
    # fix checkboxes
    fix_checkbox(data, ['no_moscow'])
    row = FilialInfo.new(data)
    row.save
  end

  # ФЗ-115 (5.6)
  def self.ncc_federal_law_sync(s4_user)
    nccFederalLaw = S4::NccFederalLaw.all(s4_user)
    data = nccFederalLaw.first.attributes.symbolize_keys
    data[:s4_id] = data[:id]
    data[:user] = s4_user
    data.delete(:id)
    
    # fix checkboxes
    fix_checkbox(data, ['no_corr_acc_corr_countr', 'no_corr_acc_offshore', 'no_corr_acc_drug', 'no_shell_bank_acc', 
                        'at_control_rules', 'at_control_rules_contr', 'at_identification', 'at_control_of_operation',
                        'at_control_training'])
    row = NccFederalLaw.new(data)
    row.save

    # grid ShellBankAcc
    shellBankAcc = S4::ShellBankAcc.all(s4_user)
    shellBankAcc.collect do |item|
      itemData = item.attributes.symbolize_keys
      itemData[:parent_id] = row.id
      itemData.delete(:id)
      
      r = ShellBankAcc.new(itemData)
      r.save
    end
  end

  # Сведения о капитале (5.5)
  def self.capital_sync(s4_user)
    capitalData = S4::CapitalData.all(s4_user)
    data = capitalData.first.attributes.symbolize_keys
    data[:s4_id] = data[:id]
    data[:user] = s4_user
    
    # fix checkboxes
    fix_checkbox(data, ['fully_paid', 'no_indirect_owners', 'no_ncc_profiters'])
    row = Capitals.new(data)
    row.save
  end

  # Структура управления (5.4)
  def self.structure_sync(s4_user)
    directorsHead = S4::DirectorsCommitteeHead.all(s4_user)
    #xml = S4::DirectorsCommitteeHead.get_xml(s4_user)
    authority = S4::Authority.all(s4_user)

    dataStructures = {}
    dataStructures = dataStructures.merge(directorsHead.first.attributes.symbolize_keys)

    dataStructures = dataStructures.merge(authority.first.attributes.symbolize_keys)
    dataStructures[:s4_id] = dataStructures[:id]
    dataStructures[:user] = s4_user
    dataStructures.delete(:id)

    # fix checkboxes
    fix_checkbox(dataStructures, ['no_col_commitee', 'no_executive_commitee'])

    row = Structure.new(dataStructures)
    row.save
    
    ## grids
    # Shareholders
    shareholder = S4::Shareholder.all(s4_user)
    shareholder.collect do |item|
      data = item.attributes.symbolize_keys
      data[:parent_id] = row.id
      shareholderRow = StrukturesShareholder.new(data)
      shareholderRow.save
    end

    # DirectorsCommittee
    directorsCommittee = S4::DirectorsCommittee.all(s4_user)
    self.directors_add(directorsCommittee, "directors_committee", s4_user, row.id)
    
    # DirectorsCommittee
    direction = S4::Direction.all(s4_user)
    self.directors_add(direction, "direction", s4_user, row.id)
  end

  # 
  def self.directors_add(rowset, type, s4_user, parent_id)
    rowset.collect do |item|
      data = item.attributes.symbolize_keys
      data[:s4_user] = s4_user
      data[:parent_id] = parent_id
      data[:grid_name] = type
      row = StrukturesControl.new(data)
      row.save
    end
  end

  # Контролеры (5.3)
  def self.controllers_sync(s4_user)
    controllers = S4::Controller.all(s4_user);

    qualifications = Organizations::Attestatadd.qualification_select
    activities = Organizations::Attestatadd.activity_select
    controllers.collect do |cont|
      data = cont.attributes.symbolize_keys

      data[:s4_id] = data[:id]
      data[:user] = s4_user
      data.delete(:id)

      row = Controller.new(data)
      row.save
      
      # add attestats
      S4::ControllerAttestat.scope = {:id => data[:s4_id]}
      attestats = S4::ControllerAttestat.all_with_scope(s4_user)
      
      attestats.collect do |att|
        att_data = att.attributes.symbolize_keys
        att_data[:parent_id] = row.id
        
        q = []
        qualifications.collect do |v|
          q << v if att_data[:"activity_#{v.to_s}"] == 1.to_s
        end
        att_data[:qualification] = "[#{q.join(',')}]"
        
        a = []
        activities.collect do |v|
          a << v if att_data[:"qualification_#{v.to_s}"] == 1.to_s
        end
        att_data[:activity] =  "[#{a.join(',')}]"
        
        att_row = ControllersAttestat.new(att_data)
        att_row.save
      end # attestats
    end
    
  end

  # Руководитель (5.3)
  def self.ceo_sync(s4_user)
    ceo = S4::CEO.all(s4_user).first
    
    data = ceo.attributes.symbolize_keys
    data[:s4_id] = data[:id]

    data.delete(:id)
    data[:user] = s4_user
    
    # fix checkbox
    fix_checkbox(data, ["organs_in_place"])
    
    row = Ceo.new(data)
    row.save

    # attestats
    qualifications = Organizations::Attestatadd.qualification_select
    activities = Organizations::Attestatadd.activity_select

    ceo_attestats = S4::CEO_Attestat.all(s4_user)
    ceo_attestats.collect do |att|
      att_data = att.attributes.symbolize_keys
      att_data[:parent_id] = row.id
      
      q = []
      qualifications.collect do |v|
        q << v if att_data[:"activity_#{v.to_s}"] == 1.to_s
      end
      att_data[:qualification] = "[#{q.join(',')}]"
      
      a = []
      activities.collect do |v|
        a << v if att_data[:"qualification_#{v.to_s}"] == 1.to_s
      end
      att_data[:activity] =  "[#{a.join(',')}]"
      
      att_row = CeoAttestat.new(att_data)
      att_row.save
    end # ceo_attestats
  end

  # Лицензии (5.2)
  def self.licenses_sync(s4_user)
    licensesDoc = Nokogiri::XML::parse S4::License.get_xml(s4_user)
    licenses = S4::License.all(s4_user)
    licenses.collect do |lic|
      data = lic.attributes.symbolize_keys
      data[:user] = s4_user

      data[:licence_organ] = ""
      data[:licence_type] = ""
      recource = licensesDoc.xpath('//resource/property[@name="id" and .="' << data[:id] << '"]/parent::resource').first
      data[:licence_organ] = recource.xpath('./property[@name="licence_organ"]').attribute('ref_id').value if !recource.nil?
      data[:licence_type] = recource.xpath('./property[@name="licence_type"]').attribute('ref_id').value if !recource.nil?
      
      data[:kind] = "banking"
      type_id = recource.xpath('./property[@name="licence_kind"]').attribute('ref_id').value if !recource.nil?
      data[:kind] = S4::LicenceKind.getKindById(type_id) if !type_id.nil?
      data.delete(:licence_status)
      data.delete(:id)
      row = Licenses.new(data)
      row.save
    end
  end

  # Общие сведения (5.1)
  def self.organization_sync(s4_user)
    #organizationDoc= Nokogiri::XML::parse S4::Organization.get_xml(s4_user)
    organization = S4::Organization.all(s4_user).first

    data = organization.attributes.symbolize_keys
    data[:s4_id] = data.delete(:id)
    data.delete(:okveds)
    data[:user] = s4_user
    row = Organization.new(data)
    row.save
    
    okveds = S4::Okved.all(s4_user)
    okveds.collect do |okved|
      okved = okved.attributes.symbolize_keys
      okved[:parent_id] = row.id
      okved[:s4_id] = okved.delete(:id)
      okved_row = Okved.new(okved)
      okved_row.save
    end
  end

  def self.reg_card_executor_sync(s4_user)
    regcardData = S4::RegCardExecutor.all(s4_user)
    data = regcardData.first.attributes.symbolize_keys
    data[:s4_id] = data[:id]
    data[:user] = s4_user
    
    # fix checkboxes
    row = RegCardExecutor.new(data)
    row.save
  end

  def self.fix_checkbox(row, fields)
    fields.collect do |field|
      row[:"#{field}"] = false if row[:"#{field}"].nil? || row[:"#{field}"] == '' 
    end
  end
end

