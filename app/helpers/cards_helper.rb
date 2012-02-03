module CardsHelper
  def contextual_menu
    # main menu
    menu = navigation.ul :html => { :id => :contextual_menu, :class => [:tabbed_menu, :level1].join(' ')} do |ul|
      ul.li(t(:index, :scope => [:cards, :contextual_menu]), cards_path,             :cards => :index)
      ul.li(t(:sendcard, :scope => [:cards, :contextual_menu]), sendcard_cards_path, :cards => :sendcard)
      ul.li t(:sendtomarket, :scope => [:cards, :contextual_menu]), form_senddocuments_path,     :senddocuments => :form
    end
    
    content_tag :div, menu, {:id => "dropdownmenu"}
  end

  def send_card(sendcardData)
    row = RegCardExecutor.new(sendcardData)
    doc = Nokogiri::XML::parse S4::RegCardExecutor.get_xml(s4_user)
    row.s4_id = doc.xpath('//property[@name="id"]').first.content
    row.user = s4_user

    regCardExecutorXML = S4::RegCardExecutor.create_xml(row)
    
    organizationRow = Organization.find_by_user(s4_user)
    organizationXML = S4::Organization.create_xml(organizationRow)

    licensesRow = Licenses.find_all_by_user(s4_user)
    licensesXML = S4::License.create_xml(licensesRow)
    
    # authority
    authorityRow = Structure.find_by_user(s4_user)
    authorityXML = S4::Authority.create_xml(authorityRow)
    
    directorsCommitteeHeadXML = S4::DirectorsCommitteeHead.create_xml(authorityRow)
    
    shareHolderRowset = []
    shareHolderRowset = StrukturesShareholder.find_all_by_parent_id(authorityRow.id) if !authorityRow.nil?
    shareHolderXML = S4::Shareholder.create_xml(shareHolderRowset)
    
    directorsCommitteeRowset = []
    directorsCommitteeRowset = StrukturesControl.find_all_by_parent_id_and_gridname(authorityRow.id, 'directors_committee') if !authorityRow.nil?
    directorsCommitteeXML = S4::DirectorsCommittee.create_xml(directorsCommitteeRowset)
    
    directionRowset = [] 
    directionRowset = StrukturesControl.find_all_by_parent_id_and_gridname(authorityRow.id, 'direction') if !authorityRow.nil? && authorityRow.no_executive_commitee != true
    directionXML = S4::DirectorsCommittee.create_xml(directionRowset)
    
    #ceo
    ceoRow = Ceo.find_by_user(s4_user)
    ceoXML = S4::CEO.create_xml(ceoRow)

    # capital
    capitalDataRow = Capitals.find_by_user(s4_user)
    capitalDataXML = S4::CapitalData.create_xml(capitalDataRow)

    # ncc_federal_law
    nccFederalLawRow = NccFederalLaw.find_by_user(s4_user)
    nccFederalLawXML = S4::NccFederalLaw.create_xml(nccFederalLawRow)
    shellBankAccRowset = []
    shellBankAccRowset = ShellBankAcc.find_all_by_parent_id(nccFederalLawRow.id) if !nccFederalLawRow.nil? && nccFederalLawRow.no_shell_bank_acc != true
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
end
