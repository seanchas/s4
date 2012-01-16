class UserCardsSyncS4 < ActiveRecord::Base
  attr_accessible :user
  
  def self.sync(s4_user)

    self.licenses_sync(s4_user)
    self.ceo_sync(s4_user)
    self.controller_sync(s4_user)
    self.authority_sync(s4_user)
    self.capital_sync(s4_user)
    self.ncc_federal_law_sync(s4_user)
    self.filial_info(s4_user)
    self.contacts_sync(s4_user)
    self.phones_sync(s4_user)

    # after fully updates (sync once)
    UserCardsSyncS4.new({:user => s4_user}).save
  end
  
private
  # Контактные лица (5.9)
  def self.contacts_sync(s4_user)
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
      
      recource = phonesDoc.xpath('//resource/property[@name="id" and .="' << data[:id] << '"]/parent::resource').first
      contact_group = nil
      contact_group = recource.xpath('./property[@name="contact_group"]').attribute('ref_id').value if !recource.nil?
      data[:kind] = S4::ContactGroup.getKindById(contact_group)
      data[:user] = s4_user

      data.delete(:contact_group)
      data.delete(:id)
      row = Phones.new(data)
      row.save
    end
  end

  # Филиалы (5.7)
  def self.filial_info(s4_user)
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
    
    indirectOwner = S4::IndirectOwner.all(s4_user)
    indirectOwner.collect do |item|
      itemData = item.attributes.symbolize_keys
      itemData[:parent_id] = row.id
      itemData.delete(:id)
      
      r = IndirectOwner.new(itemData)
      r.save
    end

    profiterContract = S4::ProfiterContract.all(s4_user)
    profiterContract.collect do |item|
      itemData = item.attributes.symbolize_keys
      itemData[:parent_id] = row.id
      itemData.delete(:id)
      
      r = ProfiterContract.new(itemData)
      r.save
    end
    logger.debug "#{capitalData.to_yaml}\n\n#{indirectOwner.to_yaml}\n\n#{profiterContract.to_yaml}"
  end

  # Структура управления (5.4)
  def self.authority_sync(s4_user)
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

    row = Structures.new(dataStructures)
    row.save
    
    ## grids
    # Shareholders
    shareholder = S4::Shareholder.all(s4_user)
    shareholder.collect do |item|
      data = item.attributes.symbolize_keys
      data[:parent_id] = row.id
      shareholderRow = Struktures_shareholder.new(data)
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
      row = Struktures_Controls.new(data)
      row.save
    end
  end

  # Контролеры (5.3)
  def self.controller_sync(s4_user)
    controllers = S4::Controller.all(s4_user);

    qualifications = Organizations::Attestatadd.qualification_select
    activities = Organizations::Attestatadd.activity_select
    controllers.collect do |cont|
      data = cont.attributes.symbolize_keys

      data[:s4_id] = data[:id]
      data[:user] = s4_user
      data.delete(:id)

      row = Controllers.new(data)
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
        
        att_row = ControllersAttestats.new(att_data)
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

      recource = licensesDoc.xpath('//resource/property[@name="id" and .="' << data[:id] << '"]/parent::resource').first
      data[:licence_organ] = recource.xpath('./property[@name="licence_organ"]').attribute('ref_id').value
      data[:licence_type] = recource.xpath('./property[@name="licence_type"]').attribute('ref_id').value
      
      data[:user] = s4_user
      type_id = recource.xpath('./property[@name="licence_kind"]').attribute('ref_id').value
      data[:kind] = S4::LicenceKind.getKindById(type_id)
      data.delete(:licence_status)
      data.delete(:id)
      row = Licenses.new(data)
      row.save
    end
  end
  
  def self.fix_checkbox(row, fields)
    fields.collect do |field|
      row[:"#{field}"] = false if row[:"#{field}"].nil? || row[:"#{field}"] == '' 
    end
  end
end

