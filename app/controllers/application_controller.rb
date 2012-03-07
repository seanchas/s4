class ApplicationController < ActionController::Base
 
  before_filter :authenticate
  before_filter :authenticate_with_s4!
  before_filter :init_s4_user_in_models
  
  after_filter :cleanup_cache_control

  helper_method :s4_user
  
  def s4_organization
    
  end
  
  def s4_user
    authenticated_user.s4_key if authenticated? && authenticated_user.s4_key.present?
  end
  
  def rescue_action_in_public(exception)
    case exception
      when ActionController::UnknownAction, ActionController::RoutingError, ActiveRecord::RecordNotFound
        render :template => 'welcome/404', :layout => 'error'
      else
        render :template => 'welcome/500', :layout => 'error'
    end
  end

  def send_card(sendcardData)
    row = RegCardExecutor.new(sendcardData)
    doc = Nokogiri::XML::parse S4::RegCardExecutor.get_xml(s4_user)
    row.s4_id = doc.xpath('//property[@name="id"]').first.content
    row.user = s4_user

    regCardExecutorXML = S4::RegCardExecutor.create_xml(row)

    scope = {}
    getAssoc.collect do |k, v|
      scope[k] = send(v)
    end
    scope[:reg_card_executor] = regCardExecutorXML
    S4::Card.scope = scope

    data =""
    data = S4::Card.set_with_scope_xml(s4_user)
    data
  end

  def validateS4(types)
    begin
      scope = {}
      assoc = getAssoc
      syncDbFields = {}
      errorsDbFields = {}
      types.collect do |e|
        scope[e] = send(assoc[e])
        syncDbFields[getGroupByResourceName(e).to_sym] = true
        errorsDbFields[getGroupByResourceName(e).to_sym] = nil
      end

      UserCardsSyncS4.update_all(syncDbFields, {:user => s4_user})
      RegCardErrors.update_all(errorsDbFields, {:user => s4_user})

      S4::Card.scope = scope
      
      S4::Card.set_with_scope_xml(s4_user)
    rescue Exception => e
      logger.debug "SEND CARD ERROR MESSAGE: #{e.message}\n#{e.backtrace.to_yaml}\n\n" if /^<resources>/.match(e.message).nil?
      Rails.cache.write cache_key('cards.sendcard.reg_card_error'), e.message
      
      if !types.index(:organization).nil? || !types.index(:okved).nil?
        types.insert(0, :show)
      end
      getErrors(types)
    end
  end

private

  def getAssoc
    {
      :licence => :getLicensesXML,
      :organization => :getOrganizationXML,
      
      :controller => :getControllerXML,
      :controller_attestat => :getControllerAttestatXML,
      
      :shareholder => :getShareHolderXML,
      :authority => :getAuthorityXML,
      :directors_committee_head => :getDirectorsCommitteeHeadXML,
      :directors_committee => :getDirectorsCommitteeXML,
      :direction => :getDirectionXML,
      
      :ceo => :getCeoXML,
      :ceo_attestat => :getCeoAttestatXML,

      :capital_data => :getCapitalDataXML,

      :ncc_federal_law => :getNccFederalLawXML,
      :shell_bank_acc => :getShellBankAccXML,
      
      :filial_info => :getFilialInfoXML,

      :contact => :getContactXML,

      :alert_phone => :getAlertPhoneXML
     }
  end

  def getAlertPhoneXML
    row = UserCardsSyncS4.find_by_user(s4_user)
    kinds = []
    kinds << 'valuta' if !row.no_phone_valuta
    kinds << 'fondovii' if !row.no_phone_fondovii
    kinds << 'srochnii' if !row.no_phone_srochnii
    kinds << 'cenii' if !row.no_phone_cenii

    alertPhonesRowset = Phones.find_all_by_user_and_kind(s4_user, kinds)
    S4::AlertPhone.create_xml(alertPhonesRowset)
  end

  def getContactXML
    row = UserCardsSyncS4.find_by_user(s4_user)
    kinds = []
    kinds << 'valuta' if !row.no_contact_valuta
    kinds << 'fondovii' if !row.no_contact_fondovii
    kinds << 'srochnii' if !row.no_contact_srochnii
    kinds << 'cenii' if !row.no_contact_cenii

    contactRowset = Contacts.find_all_by_user_and_kind(s4_user, kinds)
    S4::Contact.create_xml(contactRowset)
  end

  def getControllerAttestatXML
    controllersRowset = Controller.find_all_by_user(s4_user)
    ids = []
    controllersRowset.collect {|r| ids << r.id}
    controllersAttestatRowset = ControllersAttestat.find_all_by_parent_id(ids)
    S4::ControllerAttestat.create_xml(controllersAttestatRowset)
  end

  def getControllerXML
    controllersRowset = Controller.find_all_by_user(s4_user)
    S4::Controller.create_xml(controllersRowset)
  end

  def getFilialInfoXML
    filialInfoRow = FilialInfo.find_by_user(s4_user)
    S4::FilialInfo.create_xml(filialInfoRow)
  end

  def getShellBankAccXML
    nccFederalLawRow = NccFederalLaw.find_by_user(s4_user)
    shellBankAccRowset = []
    shellBankAccRowset = ShellBankAcc.find_all_by_parent_id(nccFederalLawRow.id) if !nccFederalLawRow.nil? && nccFederalLawRow.no_shell_bank_acc != true
    S4::ShellBankAcc.create_xml(shellBankAccRowset)
  end

  def getNccFederalLawXML
    nccFederalLawRow = NccFederalLaw.find_by_user(s4_user)
    S4::NccFederalLaw.create_xml(nccFederalLawRow)
  end
  
  def getCapitalDataXML
    capitalDataRow = Capitals.find_by_user(s4_user)
    S4::CapitalData.create_xml(capitalDataRow)
  end

  def getCeoXML
    ceoRow = Ceo.find_by_user(s4_user)
    S4::CEO.create_xml(ceoRow)
  end
  
  def getCeoAttestatXML
    ceoRow = Ceo.find_by_user(s4_user)
    ceoAttestatRowset = []
    ceoAttestatRowset = CeoAttestat.find_all_by_parent_id(ceoRow.id) if !ceoRow.nil? && ceoRow.no_attestats != true
    S4::CEO_Attestat.create_xml(ceoAttestatRowset)
  end

  def getDirectionXML
    authorityRow = Structure.find_by_user(s4_user)
    directionRowset = [] 
    directionRowset = StrukturesControl.find_all_by_parent_id_and_gridname(authorityRow.id, 'direction') if !authorityRow.nil? && !authorityRow.no_executive_commitee?
    S4::Direction.create_xml(directionRowset)
  end

  def getDirectorsCommitteeXML
    authorityRow = Structure.find_by_user(s4_user)
    directorsCommitteeRowset = []
    directorsCommitteeRowset = StrukturesControl.find_all_by_parent_id_and_gridname(authorityRow.id, 'directors_committee') if !authorityRow.nil?
    S4::DirectorsCommittee.create_xml(directorsCommitteeRowset)
  end

  def getShareHolderXML
    authorityRow = Structure.find_by_user(s4_user)
    shareHolderRowset = []
    shareHolderRowset = StrukturesShareholder.find_all_by_parent_id(authorityRow.id) if !authorityRow.nil?
    S4::Shareholder.create_xml(shareHolderRowset)
  end

  def getDirectorsCommitteeHeadXML
    authorityRow = Structure.find_by_user(s4_user)
    S4::DirectorsCommitteeHead.create_xml(authorityRow)
  end

  def getAuthorityXML
    authorityRow = Structure.find_by_user(s4_user)
    S4::Authority.create_xml(authorityRow)
  end

  def getLicensesXML
    licensesRow = Licenses.find_all_by_user(s4_user)
    S4::License.create_xml(licensesRow)
  end

  def getOrganizationXML
    organizationRow = Organization.find_by_user(s4_user)
    S4::Organization.create_xml(organizationRow)
  end

  def init_s4_user_in_models
    Organizations::Grids::GridStore.s4_user = s4_user
    Organizations::AbstractForm.s4_user = s4_user
  end

  def authenticate_with_s4!
    authenticate!
    throw :warden unless s4_user.present?
  end
  
  def cleanup_cache_control
    response.headers.delete "Cache-Control"
  end
end
