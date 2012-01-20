class OrganizationsController < ApplicationController
  
  helper :members_menu
  include OrganizationsHelper
  include ApplicationHelper
  
  before_filter :populateFromS4
  before_filter :show_errors_by_resource
  before_filter :check_edited_form

  def show
    @organization = S4::Organization.find(s4_user)
  end

  def management
    @organization = S4::Organization.find(s4_user)
    @ceo          = S4::CEO.find(s4_user)
    @controllers  = S4::Controller.all(s4_user)
    @signers      = S4::Signer.all(s4_user)
  end
	
  def starbox
    formvoting = params[:formvoting]
    @formvting = Formvoting.new(formvoting)
    if @formvting.valid?
      scope = {
        'personal_manager_id' => params[:formvoting][:user_id],
        'rating' => params[:formvoting][:average],
        'note' => params[:formvoting][:note]
      }
      S4::PersonalManagerRating.scope = scope
      S4::PersonalManagerRating.set_with_scope(s4_user)
    else
      session['formvoting'] = @formvting
      session['formvoting_params'] = formvoting
    end
    
    redirect_to :action => 'manager'
  end
  
	def manager
		@organization = S4::Organization.find(s4_user)
    @sessionId = S4.connection.call("s4.openSession", I18n.locale)
		@documentList = S4.connection.call("s4.getResource", @sessionId, 'personal_manager', s4_user)
    @documentList = S4::Resource.parse_many(@documentList)

    formvoting_param = !session['formvoting_params'].nil? ? session.delete('formvoting_params') : nil
    
    if !session['formvoting'].nil?
      @formvoting = session.delete('formvoting')
    else
      @formvoting = Formvoting.new
    end
    
    @documentList.each do |column|
     
      S4::PersonalManagerRating.scope = {'personal_manager_id' => column["id"]}
      @pm_rating = S4::PersonalManagerRating.find_with_scope(s4_user).attributes
      
      column["pm_rating"] = @pm_rating
      
      if @pm_rating["rating"].nil?
        column["rating"] = 0
      elsif formvoting_param && formvoting_param[:user_id] == column["id"]
        column["rating"] = formvoting_param[:average]
      else 
        column["rating"] = @pm_rating["rating"]
      end
      
      if !@pm_rating["rating_date"].nil?
        column["rating_date"] = @pm_rating["rating_date"]
      end
        
	    if column['photo_base64'] == ""
	      column["photo_base64"] = '/upload/no_photo.jpeg'
		  else
		    if ( column["photo_file_name"].slice("jpg") == "jpg")
		      fileExist = "jpg"
		    elsif ( column["photo_file_name"].slice("gif") == "gif")
		      fileExist = "gif"
		    elsif ( column["photo_file_name"].slice("png") == "png")
		      fileExist = "png"
		    elsif ( column["photo_file_name"].slice("jpeg") == "jpeg")
		      fileExist = "jpeg"
		    end
		         
		    
		    base_64_encoded_data2 = column["photo_base64"].gsub("<br/>","")
	      File.open(RAILS_ROOT + '/public/upload/managerId_' + column["id"] + '.' + fileExist, 'wb') do|f|
			    f.write(Base64.decode64(base_64_encoded_data2))
		    end
		    column["photo_base64"] = '/upload/managerId_' + column["id"] + '.' + fileExist
		  end
	  end

	end #manager
  

  def structure
    if form_params =  Structures.find_by_user( s4_user )
      shareholder_data = convertForRowset( Struktures_shareholder.find_all_by_parent_id_and_user(form_params[:id], form_params[:user]  ) )
      directors_committee_date = convertForRowset( Struktures_Controls.find_all_by_parent_id_and_user_and_gridname( form_params[:id], form_params[:user], "directors_committee") )
      direction_data = convertForRowset(Struktures_Controls.find_all_by_parent_id_and_user_and_gridname( form_params[:id], form_params[:user], "direction" ) )

      shareholder = Organizations::Grids::Structure::Structure.new
      directors_committee = Organizations::Grids::Structure::Structure_isponitelny_organ.new
      direction = Organizations::Grids::Structure::Structure_organa_ypravleniya.new
      
      shareholder.rowset = shareholder_data
      directors_committee.rowset = directors_committee_date
      direction.rowset = direction_data

      kollegialorganForm = Organizations::Structure::Kollegial_organ.new({
          :col_commitee_name => form_params[:col_commitee_name],
          :no_col_commitee => form_params[:no_col_commitee],
          :board_fio => form_params[:board_fio],
          :board_firstname => form_params[:board_firstname],
          :board_patronymic => form_params[:board_patronymic],
          :board_position => form_params[:board_position],
          :directors_committee => directors_committee,
        })

      formParams = {
        :id_item => form_params[:id],
        :main_commitee_name => form_params[:main_commitee_name],
        :shareholder => shareholder,

        :directors_committee => kollegialorganForm,
        :executive_commitee_name => form_params[:executive_commitee_name],
        :direction => direction,
        :no_executive_commitee => form_params[:no_executive_commitee]
      }
      @structure = Organizations::Structure.new(formParams)
    else
      @structure = Organizations::Structure.new
    end
    

  end
  
  
  def structureedit
    params[:structure][:user] = s4_user

    kollegialorgan = params[:structure][:directors_committee]
    params[:structure].delete(:directors_committee)

    paramsMerge = params[:structure].merge(kollegialorgan)

    if paramsMerge[:id_item].is_numeric? && paramsMerge[:id_item] != '0'
      struktureForm = Structures.update(paramsMerge[:id_item], paramsMerge)
    else
      struktureForm = Structures.new(paramsMerge)
    end
    struktureForm.save

    Struktures_shareholder.delete_all(["parent_id = ?", struktureForm.id])
    if paramsMerge[:shareholder]
      paramsMerge[:shareholder].each do |k,data|
        data[:parent_id] = struktureForm.id
        data[:user] = s4_user
  
        strukturesFivepercentObject = Struktures_shareholder.new( data )
        strukturesFivepercentObject.save
      end
    end

    Struktures_Controls.delete_all(["parent_id = ?", struktureForm.id])
    if paramsMerge[:directors_committee]
      paramsMerge[:directors_committee].each do |k,data|
        data[:gridname] = 'directors_committee'
        data[:parent_id] = struktureForm.id
        data[:user] = s4_user

        controlsObject1 = Struktures_Controls.new( data )
        controlsObject1.save
      end
    end

    if paramsMerge[:direction]
      paramsMerge[:direction].each do |k,data|
        data[:gridname] = 'direction'
        data[:parent_id] = struktureForm.id
        data[:user] = s4_user
  
        controlsObject2 = Struktures_Controls.new( data )
        controlsObject2.save
      end
    end
    session["edit_form"] = 1
    redirect_to(:action => "structure")
  end
  
  def ceo
    if form_params =  Ceo.find_by_user( s4_user )
      
      attestats = CeoAttestat.find_all_by_parent_id( form_params[:id] )
      
      attestats.collect do |row|
        row[:qualification] = row[:qualification][1..-2].split(",").collect!{|x| x.to_sym} if !row[:qualification].nil?
        row[:activity] = row[:activity][1..-2].split(",").collect!{|x| x.to_sym} if !row[:activity].nil?
      end

      attestatinfo = convertForRowset( attestats )

      grid = Organizations::Grids::Controllers::Attestat.new
      grid.rowset = attestatinfo
      formParams = {
        :id_item => form_params[:id],
        :firstname => form_params[:firstname],
        :surname => form_params[:surname],
        :patronymic => form_params[:patronymic],
        :position => form_params[:position],
        :doc_name => form_params[:doc_name],
        :doc_number => form_params[:doc_number],
        :doc_date => form_params[:doc_date],
        :organs_in_place => form_params[:organs_in_place],
        :organs_place_other => form_params[:organs_place_other],
        :certificates => grid
      }
      @ceo = Organizations::Ceo.new(formParams)
    else
      @ceo = Organizations::Ceo.new({:id_item => 0})
    end

    @data = Controllers.find_all_by_user(s4_user)
    @admin = Organizations::Grids::Controllers::Controllers.new
    @admin.rowset = @data
  end
  
  def ceo_new
    ceo_create(params)
    session["edit_form"] = 1
    redirect_to :action => 'ceo'
  end
  
  def capital
    if form_params =  Capitals.find_by_user( s4_user )
      
      indirect_owner_data = convertForRowset( IndirectOwner.find_all_by_parent_id( form_params[:id] ) )
      indirect_owner_grid = Organizations::Grids::Capital::Indirectowner.new
      indirect_owner_grid.rowset = indirect_owner_data
      
      
      profiter_contract_data = convertForRowset( ProfiterContract.find_all_by_parent_id( form_params[:id] ) )
      profiter_contract_grid = Organizations::Grids::Capital::Profitercontract.new
      profiter_contract_grid.rowset = profiter_contract_data
      
      
      formParams = {
        :id_item => form_params[:id],
        :auth_capital_vol => form_params[:auth_capital_vol],
        :auth_capital_vollit => form_params[:auth_capital_vollit],
        :fully_paid => form_params[:fully_paid],
        :unpaid_auth_capital_vol => form_params[:unpaid_auth_capital_vol],
        :unpaid_auth_capital_vollit => form_params[:unpaid_auth_capital_vollit],
        :no_indirect_owners => form_params[:no_indirect_owners],
        :no_ncc_profiters => form_params[:no_ncc_profiters],
        :indirect_owner => indirect_owner_grid,
        :profiter_contract => profiter_contract_grid
      }
      @capital = Organizations::Capital.new(formParams)
    else
      @capital = Organizations::Capital.new({:id_item => 0})
    end
  end
  
  def capitalsave
    capital_add(params)
    session["edit_form"] = 1
    redirect_to :action => 'capital'
  end
  
  def filials
    row = FilialInfo.find_by_user(s4_user)
    data = {}
    if !row.nil?
      data = row.attributes.symbolize_keys
      data[:id_item] = data[:id]
      data.delete(:s4_id)
      data.delete(:user)
      data.delete(:id)
    else
      data[:id_item] = 0
    end
    
    @filials = Organizations::Filials.new(data)
 end
 
  def filialscreate
      
    params[:filials][:user] = s4_user

    if params[:filials][:id_item].is_numeric? && params[:filials][:id_item] != "0"
      filialObject = FilialInfo.update(params[:filials][:id_item], params[:filials] )
    else 
      filialObject = FilialInfo.new( params[:filials] )
    end
    filialObject.save
    session["edit_form"] = 1
    redirect_to :action => 'filials'
  end
  
  def contactlist
    valuta_grid = Organizations::Grids::Contactlist::Contacts_v.new
    fondovi_grid = Organizations::Grids::Contactlist::Contacts_f.new
    srochni_grid = Organizations::Grids::Contactlist::Contacts_s.new
    cenii_grid = Organizations::Grids::Contactlist::Contacts_c.new
    
    
    valuta_grid.rowset = convertForRowset(Contacts.find_all_by_kind_and_user('valuta', s4_user))
    fondovi_grid.rowset = convertForRowset(Contacts.find_all_by_kind_and_user('fondovii', s4_user))
    srochni_grid.rowset = convertForRowset(Contacts.find_all_by_kind_and_user('srochnii', s4_user))
    cenii_grid.rowset = convertForRowset(Contacts.find_all_by_kind_and_user('cenii', s4_user))

    formParams = {
      :valuta => valuta_grid,
      :fondovii => fondovi_grid,
      :srochnii => srochni_grid,
      :cenii => cenii_grid
    }
    @contactlist = Organizations::Contactlist.new(formParams)
  end
   
  def contactsnew
    new_contact(params[:contactlist].nil? ? {} : params[:contactlist])
    session["edit_form"] = 1
    redirect_to :action => 'contactlist'
  end
  
  def phones
    phones_v_grid = Organizations::Grids::Phones::Phones_v.new
    phones_f_grid = Organizations::Grids::Phones::Phones_f.new
    phones_s_grid = Organizations::Grids::Phones::Phones_s.new
    phones_c_grid = Organizations::Grids::Phones::Phones_c.new
    
    
    phones_v_grid.rowset = convertForRowset(Phones.find_all_by_kind_and_user('valuta', s4_user))
    phones_f_grid.rowset = convertForRowset(Phones.find_all_by_kind_and_user('fondovii', s4_user))
    phones_s_grid.rowset = convertForRowset(Phones.find_all_by_kind_and_user('srochnii', s4_user))
    phones_c_grid.rowset = convertForRowset(Phones.find_all_by_kind_and_user('cenii', s4_user))

    formParams = {
      :valuta => phones_v_grid,
      :fondovii => phones_f_grid,
      :srochnii => phones_s_grid,
      :cenii => phones_c_grid
    }
    @phones = Organizations::Phones.new(formParams)
 end
 
 def phonesadd
   @phonesadd = Organizations::Phonesadd.new
 end
 
 def phonenew
   new_phone(params[:phones].nil? ? {} : params[:phones])
   session["edit_form"] = 1
   redirect_to :action => 'phones'  
 end
 
  def licenses
    bankingGrid = Organizations::Grids::Licenses::Banking.new
    professionalmemberGrid = Organizations::Grids::Licenses::Professionalmember.new
    forwardmarketGrid = Organizations::Grids::Licenses::Forwardmarket.new
    otherGrid = Organizations::Grids::Licenses::Other.new
    
    
    bankingGrid.rowset = convertForRowset(Licenses.find_all_by_kind_and_user('banking', s4_user))
    professionalmemberGrid.rowset = convertForRowset(Licenses.find_all_by_kind_and_user('professionalmember', s4_user))
    forwardmarketGrid.rowset = convertForRowset(Licenses.find_all_by_kind_and_user('forwardmarket', s4_user))
    otherGrid.rowset = convertForRowset(Licenses.find_all_by_kind_and_user('other', s4_user))

    formParams = {
      :banking => bankingGrid,
      :professionalmember => professionalmemberGrid,
      :forwardmarket => forwardmarketGrid,
      :other => otherGrid
    }
    @licenses = Organizations::License.new(formParams)

  end
  
  def licensessave
    #@forwardmarket = Licenses.find_all_by_kind('banking')
    licenses_save(params[:licenses].nil? ? {} : params[:licenses])
    session["edit_form"] = 1
    redirect_to :action => 'licenses'
  end

  def controllersadd
    if !session["controlleradd"].nil?
      @controllersadd = session.delete("controlleradd")
      if !@controllersadd.controllers.nil? && @controllersadd.controllers.is_a?(::HashWithIndifferentAccess)
        grid = Organizations::Grids::Controllers::Attestat.new
        grid.rowset = []
        @controllersadd.controllers.map do |k, v|
          grid.rowset << v.to_hash
        end
        @controllersadd.controllers = grid
      end
    else
      @controllersadd = Organizations::Controllersadd.new({:id_item => 0})
    end
  end
  
  def controlleraddsave
    data = params[:controllersadd]

    @controlleradd = Organizations::Controllersadd.new(data.symbolize_keys)
    if @controlleradd.valid?
      data[:user] = s4_user
      controllersSave(data.nil? ? {} : data)
      session["edit_form"] = 1
      redirect_to :action => :controllers
    else
      session["controlleradd"] = @controlleradd
      redirect_to :action => :controllersadd
    end
  end

  def controllereditsave
    data = params[:controllersedit]

    @controllersedit = Organizations::Controllersadd.new(data.symbolize_keys)
    if @controllersedit.valid?
      data[:user] = s4_user
      controllersSave(data.nil? ? {} : data)
      session["edit_form"] = 1
      redirect_to :action => :controllers
    else
      session["controllersedit"] = @controllersedit
      redirect_to :action => :controllersedit
    end
  end

  def controllersdelete
    if params[:id]
      Controllers.delete_all(['id = ? AND user = ?', params[:id], s4_user])
      ControllersAttestats.delete_all(['parent_id = ?', params[:id]])
      session["edit_form"] = 1
    end
    redirect_to :action => :controllers
  end

  def controllersedit
    if session["controllersedit"].nil?
      if params[:id]
        form_params =  Controllers.find_by_id_and_user( params[:id], s4_user )
  
        attestats = ControllersAttestats.find_all_by_parent_id( form_params[:id] )
        
        attestats.collect do |row|
          row[:qualification] = row[:qualification][1..-2].split(",").collect!{|x| x.to_sym} if !row[:qualification].nil?
          row[:activity] = row[:activity][1..-2].split(",").collect!{|x| x.to_sym} if !row[:activity].nil?
        end
        
        attestatinfo = convertForRowset( attestats )
        grid = Organizations::Grids::Controllers::Attestat.new
        grid.rowset = attestatinfo
        formParams = {
          :id_item => form_params[:id],
          :firstname => form_params[:firstname],
          :surname => form_params[:surname],
          :patronymic => form_params[:patronymic],
          :position=> form_params[:position],
          :doc_name => form_params[:doc_name],
          :doc_number => form_params[:doc_number],
          :doc_date => form_params[:doc_date],
          :controllers => grid
        }
        @controllersedit = Organizations::Controllersadd.new(formParams)
      else
        redirect_to :action => :controllers
      end
    else
      @controllersedit = session.delete('controllersedit')

      if !@controllersedit.controllers.nil? && @controllersedit.controllers.is_a?(::HashWithIndifferentAccess)
        grid = Organizations::Grids::Controllers::Attestat.new
        grid.rowset = []
        @controllersedit.controllers.map do |k, v|
          grid.rowset << v.to_hash
        end
        @controllersedit.controllers = grid
      end
    end

  end
  
  def controllers
    @data = Controllers.find_all_by_user(s4_user)
    @admin = Organizations::Grids::Controllers::Controllers.new
    @admin.rowset = @data
  end
  
  def ncc_federal_law
    if form_params =  NccFederalLaw.find_by_user( s4_user )
      
      attestats = ShellBankAcc.find_all_by_parent_id( form_params[:id] )

      attestatinfo = convertForRowset( attestats )

      shell_bank_acc_grid = Organizations::Grids::Ncc_federal_law::Shell_bank_acc.new
      shell_bank_acc_grid.rowset = attestatinfo
      formParams = {
        :id_item => form_params[:id],
        :corr_acc_corr_countr => form_params[:corr_acc_corr_countr],
        :no_corr_acc_corr_countr => form_params[:no_corr_acc_corr_countr],
        :corr_acc_offshore => form_params[:corr_acc_offshore],
        :no_corr_acc_drug => form_params[:no_corr_acc_drug],
        :corr_acc_drug => form_params[:corr_acc_drug],
        :no_corr_acc_offshore => form_params[:no_corr_acc_offshore],
        :no_shell_bank_acc => form_params[:no_shell_bank_acc],
        :at_control_employee_f => form_params[:at_control_employee_f],
        :at_control_employee_i => form_params[:at_control_employee_i],
        :at_control_employee_o => form_params[:at_control_employee_o],
        :at_control_rules => form_params[:at_control_rules],
        :at_control_rules_contr => form_params[:at_control_rules_contr],
        :at_identification => form_params[:at_identification],
        :at_control_of_operation => form_params[:at_control_of_operation],
        :at_control_training => form_params[:at_control_training],
        :shell_bank_acc => shell_bank_acc_grid
      }
      @ncc_federal_law = Organizations::NccFederalLaw.new(formParams)
    else
      @ncc_federal_law = Organizations::NccFederalLaw.new({:id_item => 0})
    end
  end
  
  def ncc_federal_law_edit
    ncc_federal_law_create(params)
    session["edit_form"] = 1
    redirect_to :action => 'ncc_federal_law'
  end
  
  def circulation
    @circulation = Organizations::Circulation.new
  end

  def sendcard
    @reg_card_error = getErrors
    
    if !session['card_executor'].nil?
      @card_executor = session.delete('card_executor')
    else
      data = {:reg_card_date => Time.now}
      data = data.merge(S4::RegCardExecutor.find(s4_user).attributes)
      data = session.delete('card_executor_data') if session['card_executor_data']
      @card_executor = Organizations::SendCard.new(data)
    end
  end

  def sendcardsave
    sendcardData = params[:card_executor]
    sendcardForm = Organizations::SendCard.new(sendcardData)
    if sendcardForm.valid?
      
      begin 
        @data = send_card(sendcardData)
        @data = Nokogiri::XML(@data)
        respond_to do |format|
          format.xml {
            inn = S4::Organization.find(s4_user).inn
            response.headers['Content-Disposition'] = "attachment;filename=\"#{inn}_#{DateTime.now.strftime("%d%m%y")}.xml\""
            #response.headers['Content-Disposition'] = "attachment;filename=\"222.xml\""
            response.headers['Content-Description'] = 'File Transfer'
            response.headers['Content-Transfer-Encoding'] = 'binary'
            response.headers['Expires'] = '0'
            response.headers['Pragma'] = 'public'

            render :layout=>false, :xml => @data.to_xml
          }
        end
        return
      rescue Exception => e
        Rails.cache.write cache_key('organization.sendcard.reg_card_error'), e.message
        session['card_executor_data'] = sendcardData
      end
    else
      session['card_executor'] = sendcardForm
    end
    redirect_to :action => :sendcard
  end

private
  def check_edited_form
    flag = session.delete("edit_form")
    if !flag.nil?
      @form_edit = 1
    else
      @form_edit = 0
    end
  end

  def show_errors_by_resource
    cache = Rails.cache.fetch cache_key("reg_card_errots_list")
    ers = Hash.new
    cache.collect do |k, v|
      ers[k] = v
    end

    if !ers.nil? && ers[params[:action]]
      @reg_card_errors_list = ers[params[:action]] 
  
      ers.delete params[:action]
      Rails.cache.write cache_key("reg_card_errots_list"), ers
    end 
  end

  def populateFromS4
    row = UserCardsSyncS4.find_by_user(s4_user) 

    if row.nil?
      UserCardsSyncS4.sync(s4_user)
    end
  end
end
