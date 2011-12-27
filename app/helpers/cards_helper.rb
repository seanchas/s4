module CardsHelper
  def contextual_menu
    navigation.ul :html => { :id => :contextual_menu, :class => :tabbed_menu } do |ul|
      ul.li t(:licenses, :scope => [:cards, :contextual_menu]), licenses_cards_path,             :cards => :licenses
      ul.li t(:admin, :scope => [:cards, :contextual_menu]), admin_cards_path,             :cards => :admin
      ul.li t(:controllers, :scope => [:cards, :contextual_menu]), controllers_cards_path,             :cards => [:controllers, :controllersadd, :controllersedit] 
      ul.li t(:strukture, :scope => [:cards, :contextual_menu]), strukture_cards_path,             :cards => :strukture
      ul.li t(:capital, :scope => [:cards, :contextual_menu]), capital_cards_path,             :cards => :capital
      ul.li t(:cliring, :scope => [:cards, :contextual_menu]), cliring_cards_path,             :cards => :cliring
      ul.li t(:filials, :scope => [:cards, :contextual_menu]), filials_cards_path,             :cards => :filials
      ul.li t(:phones, :scope => [:cards, :contextual_menu]), phones_cards_path,             :cards => :phones
      ul.li t(:contactlist, :scope => [:cards, :contextual_menu]), contactlist_cards_path,             :cards => :contactlist
    end
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
  
  def cliring_save(params)
    
    params[:cliring][:user] = s4_user
    
    if !params[:cliring][:id_item].nil? && params[:cliring][:id_item] != "0"
      item_id = params[:cliring][:id_item]
      Clirings.update(item_id, params[:cliring])
      
      
      
      delete_query = "DELETE FROM `scheta_clirings` WHERE `parent_id` = #{item_id}"
      ActiveRecord::Base.connection.execute( delete_query )
    else
      admincheg = Clirings.new(params[:cliring])
      admincheg.save
      item_id = admincheg.id
    end
    
    if params[:cliring][:scheta]
      params[:cliring][:scheta].each do |key,data|
        data[:parent_id] = item_id
        attest_info = Scheta_clirings.new(data)
        attest_info.save
      end
    end
    
  end
  
  
  def capital_add(params)
    params[:capital][:user] = s4_user
    
    if params[:capital][:id_item].is_numeric? && params[:capital][:id_item] != "0"
      item_id = params[:capital][:id_item]
      Capitals.update(item_id, params[:capital])
      
      delete_query_contr = "DELETE FROM `lica_capitals` WHERE `parent_id` = #{item_id}"
      ActiveRecord::Base.connection.execute( delete_query_contr )
      delete_query_v = "DELETE FROM `vigodnopreobretatels` WHERE `parent_id` = #{item_id}"
      ActiveRecord::Base.connection.execute( delete_query_v )
    else
      admincheg = Capitals.new(params[:capital])
      admincheg.save
      item_id = admincheg.id
    end
    
    if params[:capital][:controllers]
      params[:capital][:controllers].each do |key,data|
        data[:parent_id] = item_id
        cap_control = Lica_capitals.new(data)
        cap_control.save
      end
    end
    
    if params[:capital][:vigodopreobretateli]
      params[:capital][:vigodopreobretateli].each do |key,data|
        data[:parent_id] = item_id
        cap_control = Vigodnopreobretatels.new(data)
        cap_control.save
      end
    end
  end
 
  def new_phone(params)
    
    ActiveRecord::Base.connection.execute("DELETE FROM `phones` WHERE `user` = '#{s4_user}'")
    
    if params[:valuta]
      params[:valuta].each do |k,data|
        data[:deportament] = 'valuta'
        data[:user] = s4_user
        phoneObject = Phones.new( data )
        phoneObject.save
      end
    end
    
    if params[:fondovii]
      params[:fondovii].each do |k,data|
        data[:deportament] = 'fondovii'
        data[:user] = s4_user
        phoneObject = Phones.new( data )
        phoneObject.save
      end
    end
    
    if params[:srochnii]
      params[:srochnii].each do |k,data|
        data[:deportament] = 'srochnii'
        data[:user] = s4_user
        phoneObject = Phones.new( data )
        phoneObject.save
      end
    end
    
    if params[:cenii]
      params[:cenii].each do |k,data|
        data[:deportament] = 'cenii'
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
        data[:deportament] = 'cenii'
        data[:user] = s4_user
        contactObject = Contacts.new( data )
        contactObject.save
      end
    end
    
    if params[:srochnii]
      params[:srochnii].each do |k,data|
        data[:deportament] = 'srochnii'
        data[:user] = s4_user
        contactObject = Contacts.new( data )
        contactObject.save
      end
    end
    
    if params[:valuta]
      params[:valuta].each do |k,data|
        data[:deportament] = 'valuta'
        data[:user] = s4_user
        contactObject = Contacts.new( data )
        contactObject.save
      end
    end
    
    if params[:fondovii]
      params[:fondovii].each do |k,data|
        data[:deportament] = 'fondovii'
        data[:user] = s4_user
        contactObject = Contacts.new( data )
        contactObject.save
      end
    end
    
  end
  
  def admin_create(params)
    
    params[:admin][:user] = s4_user
    
    #logger.debug("my debug #{params[:admin][:id_item].to_yaml}")
    
    if params[:admin][:id_item].is_numeric? && params[:admin][:id_item] != "0"
      item_id = params[:admin][:id_item]
      Admins.update(item_id, params[:admin])
      
      
      
      delete_query = "DELETE FROM `admins_attestats` WHERE `parent_id` = #{item_id}"
      ActiveRecord::Base.connection.execute( delete_query )
    else
      admincheg = Admins.new(params[:admin])
      admincheg.save
      item_id = admincheg.id
    end
    
    if params[:admin][:attestatInfo]
      params[:admin][:attestatInfo].each do |key,data|
        data[:parent_id] = item_id
        
        if data[:qualification].class == Array
          logger.debug( data[:qualification] )
          
          data[:qualification] = data[:qualification].join(",")
          data[:qualification] = "[#{data[:qualification]}]"
        end
        
        if data[:typeof].is_a?(::Array)
          data[:typeof] = "[#{data[:typeof].join(",")}]"
        end
        attest_info = Admins_attestats.new(data)
        attest_info.save
      end
    end
    
  end
  
  def licenses_save(params)
    delete_query = "DELETE FROM `licenses` WHERE `user` = '#{s4_user}'"
    ActiveRecord::Base.connection.execute( delete_query )
    
    if params[:banking]
      params[:banking].each do |k,data|
        data[:deportament] = 'banking'
        data[:user] = s4_user
        licensesObject = Licenses.new( data )
        licensesObject.save
      end
    end
    
    if params[:professionalmember]
      params[:professionalmember].each do |k,data|
        data[:deportament] = 'professionalmember'
        data[:user] = s4_user
        licensesObject = Licenses.new( data )
        licensesObject.save
      end
    end
    
    if params[:forwardmarket]
      params[:forwardmarket].each do |k,data|
        data[:deportament] = 'forwardmarket'
        data[:user] = s4_user
        licensesObject = Licenses.new( data )
        licensesObject.save
      end
    end
    
    if params[:other]
      params[:other].each do |k,data|
        data[:deportament] = 'other'
        data[:user] = s4_user
        licensesObject = Licenses.new( data )
        licensesObject.save
      end
    end
  end
  
  
  def filialsadd()
    
  end
  
  def controllersSave(data)
    if data[:id_item].is_numeric? || data[:id_item] != '0'
      controller = Controllers.update(data[:id_item], data)
    else
      controller = Controllers.new(data)
    end
    data.delete(:id_name)
    controller.save

    Controllers_attestats.delete_all(["parent_id = ?", controller.id])
    if data[:controllers]
      data[:controllers].each do |k,item|

        item[:parent_id] = controller.id
        if item[:qualification].is_a?(::Array)
          item[:qualification] = item[:qualification].join(",")
          item[:qualification] = "[#{item[:qualification]}]"
        end
        
        if item[:typeof].is_a?(::Array)
          item[:typeof] = item[:typeof].join(",")
          item[:typeof] = "[#{item[:typeof]}]"
        end

        controllersObject = Controllers_attestats.new( item )
        controllersObject.save
      end
    end
  end
end
