class CardsController < ApplicationController
  helper :members_menu
  include CardsHelper
  
  def index
    @organization = S4::Organization.find(s4_user)
    @cards = S4::Card.all(s4_user)
  end
  
  def capital
    @s4_users4_user = s4_user
    if form_params =  Capitals.find_by_user( s4_user )
      
      controllers_data = Lica_capitals.find_all_by_parent_id( form_params[:id] )
      controllers_data.collect do |row|
        row[:qualification] = row[:qualification][1..-2].split(",").collect!{|x| x.to_sym} if !row[:qualification].nil?
        row[:typeof] = row[:typeof][1..-2].split(",").collect!{|x| x.to_sym} if !row[:typeof].nil?
      end
      controllers_data = convertForRowset( controllers_data )
      grid_controller = Cards::Grids::Capital::Controllers.new
      grid_controller.rowset = controllers_data
      
      
      vigodopreobretateli_data = Vigodnopreobretatels.find_all_by_parent_id( form_params[:id] )
      vigodopreobretateli_data.collect do |row|
        row[:qualification] = row[:qualification][1..-2].split(",").collect!{|x| x.to_sym} if !row[:qualification].nil?
        row[:typeof] = row[:typeof][1..-2].split(",").collect!{|x| x.to_sym} if !row[:typeof].nil?
      end
      vigodopreobretateli_data = convertForRowset( vigodopreobretateli_data )
      grid_vigodopreobretateli = Cards::Grids::Capital::Vigodopreobretateli.new
      grid_vigodopreobretateli.rowset = vigodopreobretateli_data
      
      
      formParams = {
        :id_item => form_params[:id],
        :ciframi => form_params[:ciframi],
        :podpis => form_params[:podpis],
        :oplachen_polnost => form_params[:oplachen_polnost],
        :ciframi_chast => form_params[:ciframi_chast],
        :podpis_chast => form_params[:podpis_chast],
        :controllers => grid_controller,
        :vigodopreobretateli => grid_vigodopreobretateli,
      }
      @capital = Cards::Capital.new(formParams)
    else
      @capital = Cards::Capital.new({:id_item => 0})
    end
  end
  
  def capitalsave
    capital_add(params)
    redirect_to :action => 'capital'
  end
  
  def filials
    row = Filials.find_by_user(s4_user)
    data = {}
    if !row.nil?
      data = row.attributes.symbolize_keys 
      data[:id_item] = data[:id]
      data.delete(:user)
      data.delete(:id)
    else
      data[:id_item] = 0
    end
    @filials = Cards::Filials.new(data)
 end
 
  def filialscreate
    params[:filials][:user] = s4_user

    if params[:filials][:id_item].is_numeric? && params[:filials][:id_item] != 0
      filialObject = Filials.update(params[:filials][:id_item], params[:filials] )
    else
      filialObject = Filials.new( params[:filials] )
    end
    filialObject.save
    
    redirect_to :action => 'filials'
  end
  
  def contactlist
    valuta_grid = Cards::Grids::Contactlist::Contacts_v.new
    fondovi_grid = Cards::Grids::Contactlist::Contacts_f.new
    srochni_grid = Cards::Grids::Contactlist::Contacts_s.new
    cenii_grid = Cards::Grids::Contactlist::Contacts_c.new
    
    
    valuta_grid.rowset = convertForRowset(Contacts.find_all_by_deportament_and_user('valuta', s4_user))
    fondovi_grid.rowset = convertForRowset(Contacts.find_all_by_deportament_and_user('fondovii', s4_user))
    srochni_grid.rowset = convertForRowset(Contacts.find_all_by_deportament_and_user('srochnii', s4_user))
    cenii_grid.rowset = convertForRowset(Contacts.find_all_by_deportament_and_user('cenii', s4_user))

    formParams = {
      :valuta => valuta_grid,
      :fondovii => fondovi_grid,
      :srochnii => srochni_grid,
      :cenii => cenii_grid
    }
    @contactlist = Cards::Contactlist.new(formParams)
  end
   
  def contactsnew
    new_contact(params[:contactlist])
    redirect_to :action => 'contactlist'
  end
  
  def phones
    phones_v_grid = Cards::Grids::Phones::Phones_v.new
    phones_f_grid = Cards::Grids::Phones::Phones_f.new
    phones_s_grid = Cards::Grids::Phones::Phones_s.new
    phones_c_grid = Cards::Grids::Phones::Phones_c.new
    
    
    phones_v_grid.rowset = convertForRowset(Phones.find_all_by_deportament_and_user('valuta', s4_user))
    phones_f_grid.rowset = convertForRowset(Phones.find_all_by_deportament_and_user('fondovii', s4_user))
    phones_s_grid.rowset = convertForRowset(Phones.find_all_by_deportament_and_user('srochnii', s4_user))
    phones_c_grid.rowset = convertForRowset(Phones.find_all_by_deportament_and_user('cenii', s4_user))

    formParams = {
      :valuta => phones_v_grid,
      :fondovii => phones_f_grid,
      :srochnii => phones_s_grid,
      :cenii => phones_c_grid
    }
    @phones = Cards::Phones.new(formParams)

 end
 
 def phonesadd
   @phonesadd = Cards::Phonesadd.new
 end
 
 def phonenew
   new_phone(params[:phones])
   redirect_to :action => 'phones'  
 end
 
  def licenses
    bankingGrid = Cards::Grids::Licenses::Banking.new
    professionalmemberGrid = Cards::Grids::Licenses::Professionalmember.new
    forwardmarketGrid = Cards::Grids::Licenses::Forwardmarket.new
    otherGrid = Cards::Grids::Licenses::Other.new
    
    
    bankingGrid.rowset = convertForRowset(Licenses.find_all_by_deportament_and_user('banking', s4_user))
    professionalmemberGrid.rowset = convertForRowset(Licenses.find_all_by_deportament_and_user('professionalmember', s4_user))
    forwardmarketGrid.rowset = convertForRowset(Licenses.find_all_by_deportament_and_user('forwardmarket', s4_user))
    otherGrid.rowset = convertForRowset(Licenses.find_all_by_deportament_and_user('other', s4_user))

    formParams = {
      :banking => bankingGrid,
      :professionalmember => professionalmemberGrid,
      :forwardmarket => forwardmarketGrid,
      :other => otherGrid
    }
    @licenses = Cards::License.new(formParams)
  end
  
  def licensessave
    #@forwardmarket = Licenses.find_all_by_deportament('banking')
    licenses_save(params[:licenses])
    redirect_to :action => 'licenses'
  end
  
  
  def admin
    @s4_users4_user = s4_user
    
    
    if form_params =  Admins.find_by_user( s4_user )
      
      attestats = Admins_attestats.find_all_by_parent_id( form_params[:id] )
      
      attestats.collect do |row|
        row[:qualification] = row[:qualification][1..-2].split(",").collect!{|x| x.to_sym} if !row[:qualification].nil?
        row[:typeof] = row[:typeof][1..-2].split(",").collect!{|x| x.to_sym} if !row[:typeof].nil?
      end

      attestatinfo = convertForRowset( attestats )

      grid = Cards::Grids::Admin::Attestatinfo.new
      grid.rowset = attestatinfo
      formParams = {
        :id_item => form_params[:id],
        :lastname => form_params[:lastname],
        :firstname => form_params[:firstname],
        :middlename => form_params[:middlename],
        :position => form_params[:position],
        :documentName => form_params[:documentName],
        :documentDate => form_params[:documentDate],
        :documentNumber => form_params[:documentNumber],
        :place => form_params[:place],
        :attestatInfo => grid
      }
      @admin = Cards::Admin.new(formParams)
    else
      @admin = Cards::Admin.new({:id_item => 0})
    end
  end
  
  def adminadd
    @admin = Cards::Adminadd.new
  end
  
  def admincreate
    admin_create(params)
    redirect_to :action => 'admin'
  end
  
  def controllers
    @data = Controllers.find_all_by_user(s4_user)
    #@admin = Cards::Controllers.new(@data)
    @admin = Cards::Grids::Admin::Controllers.new
    @admin.rowset = @data
  end
  
  def controllersadd
    @admin = Cards::Controllersadd.new({:id_item => 0})
  end
  
  def controlleraddsave
    params[:controllersadd][:user] = s4_user
    controllersSave(params[:controllersadd])
    redirect_to :action => :controllers
  end

  def controllereditsave
    params[:controllersedit][:user] = s4_user
    controllersSave(params[:controllersedit])
    redirect_to :action => :controllers
  end

  def controllersdelete
    if params[:id]
      Controllers.delete_all(['id = ? AND user = ?', params[:id], s4_user])
      ControllersAttestats.delete_all(['parent_id = ?', params[:id]])
    end
    redirect_to :action => :controllers
  end

  def controllersedit
    if params[:id]
      form_params =  Controllers.find_by_id_and_user( params[:id], s4_user )

      attestats = ControllersAttestats.find_all_by_parent_id( form_params[:id] )
      
      attestats.collect do |row|
        row[:qualification] = row[:qualification][1..-2].split(",").collect!{|x| x.to_sym} if !row[:qualification].nil?
        row[:typeof] = row[:typeof][1..-2].split(",").collect!{|x| x.to_sym} if !row[:typeof].nil?
      end
      
      attestatinfo = convertForRowset( attestats )
      grid = Cards::Grids::Admin::Attestatinfo.new
      grid.rowset = attestatinfo
      formParams = {
        :id_item => form_params[:id],
        :lastname => form_params[:lastname],
        :firstname => form_params[:firstname],
        :middlename => form_params[:middlename],
        :position => form_params[:position],
        :documentName=> form_params[:documentName],
        :documentDate => form_params[:documentDate],
        :documentNumber => form_params[:documentNumber],
        :controllers => grid
      }
      @controllersedit = Cards::Controllersadd.new(formParams)
    else
      redirect_to :action => :controllers
    end
  end
  
  def strukture
    if form_params =  Struktures.find_by_user( s4_user )
      controllers_5per_data = convertForRowset( Struktures_Fivepercents.find_all_by_parent_id_and_user(form_params[:id], form_params[:user]  ) )
      kollegia_list_1_data = convertForRowset( Struktures_Controls.find_all_by_parent_id_and_user_and_gridname( form_params[:id], form_params[:user], "kollegia_list_1") )
      kollegia_list_2_data = convertForRowset(Struktures_Controls.find_all_by_parent_id_and_user_and_gridname( form_params[:id], form_params[:user], "kollegia_list_2" ) )

      gridc5d = Cards::Grids::Strukture::Strukture.new
      gridkl1d = Cards::Grids::Strukture::Strukture_isponitelny_organ.new
      gridkl2d = Cards::Grids::Strukture::Strukture_organa_ypravleniya.new
      
      gridc5d.rowset = controllers_5per_data
      gridkl1d.rowset = kollegia_list_1_data
      gridkl2d.rowset = kollegia_list_2_data

      kollegialorganForm = Cards::Strukture::Kollegial_organ.new({
          :namus_kou => form_params[:namus_kou],
          :ystav_view => form_params[:ystav_view],
          :firstname => form_params[:firstname],
          :lastname => form_params[:lastname],
          :otchestvo => form_params[:otchestvo],
          :dolzhnost => form_params[:dolzhnost],
          :kollegia_list_1 => gridkl1d, 
        })

      formParams = {
        :id_item => form_params[:id],
        :namus_vou => form_params[:namus_vou],
        :controllers_5per => gridc5d,

        :kollegialorgan => kollegialorganForm,
        :namus_kiou => form_params[:namus_kiou],
        :kollegia_list_2 => gridkl2d,
      }
      @strukture = Cards::Strukture.new(formParams)
      
      
    else
      @strukture = Cards::Strukture.new
    end
  end
  
  
  def struktureedit
    params[:strukture][:user] = s4_user

    
    kollegialorgan = params[:strukture][:kollegialorgan]
    params[:strukture].delete(:kollegialorgan)
    
    paramsMerge = params[:strukture].merge(kollegialorgan)

    if paramsMerge[:id_item].is_numeric? && paramsMerge[:id_item] != '0'
      struktureForm = Struktures.update(paramsMerge[:id_item], paramsMerge)
    else
      struktureForm = Struktures.new(paramsMerge)
    end
    struktureForm.save

    Struktures_Fivepercents.delete_all(["parent_id = ?", struktureForm.id])
    if paramsMerge[:controllers_5per]
      paramsMerge[:controllers_5per].each do |k,data|
        data[:parent_id] = struktureForm.id
        data[:user] = s4_user
  
        strukturesFivepercentObject = Struktures_Fivepercents.new( data )
        strukturesFivepercentObject.save
      end
    end

    Struktures_Controls.delete_all(["parent_id = ?", struktureForm.id])
    if paramsMerge[:kollegia_list_1]
      paramsMerge[:kollegia_list_1].each do |k,data|
        data[:gridname] = 'kollegia_list_1'
        data[:parent_id] = struktureForm.id
        data[:user] = s4_user

        controlsObject1 = Struktures_Controls.new( data )
        controlsObject1.save
      end
    end

    if paramsMerge[:kollegia_list_2]
      paramsMerge[:kollegia_list_2].each do |k,data|
        data[:gridname] = 'kollegia_list_2'
        data[:parent_id] = struktureForm.id
        data[:user] = s4_user
  
        controlsObject2 = Struktures_Controls.new( data )
        controlsObject2.save
      end
    end
    
    redirect_to(:action => "strukture")
  end
  
  def cliring
    @s4_users4_user = s4_user

    if form_params =  Clirings.find_by_user( s4_user )
      
      attestats = Scheta_clirings.find_all_by_parent_id( form_params[:id] )

      attestatinfo = convertForRowset( attestats )

      grid = Cards::Grids::Cliring::Scheta.new
      grid.rowset = attestatinfo
      formParams = {
        :id_item => form_params[:id],
        :legal_countries => form_params[:legal_countries],
        :hidden_finance_countries => form_params[:hidden_finance_countries],
        :drugs_countries => form_params[:drugs_countries],
        :firstname => form_params[:firstname],
        :lastname => form_params[:lastname],
        :otchestvo => form_params[:otchestvo],
        :plavila_kontrolya => form_params[:plavila_kontrolya],
        :otvestv_za_pravila_kontrolya => form_params[:otvestv_za_pravila_kontrolya],
        :id_client => form_params[:id_client],
        :obyaz_kontrol => form_params[:obyaz_kontrol],
        :obychenie_kadrov => form_params[:obychenie_kadrov],
        :scheta => grid
      }
      
      @cliring = Cards::Cliring.new(formParams)
    else
     @cliring = Cards::Cliring.new({:id_item => 0})
    end
  end
  
  def cliringsave
    cliring_save(params)
    redirect_to :action => 'cliring'
  end
  
  def circulation
    @circulation = Cards::Circulation.new
  end
end
