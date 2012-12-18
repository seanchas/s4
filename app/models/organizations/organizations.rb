class Organizations::Organizations < Organizations::AbstractForm
  column :item_id, {:as => :hidden}
  
  #column :s4_id, {:input_html => {:readonly => true}}
  column :full_name, {:description => true}
  column :short_name, {:description => true}
  column :full_name_eng, {:description => true}
  column :short_name_eng, {:description => true}
  column :mesto, {:description => true}


  column :post_addr_display, {:as => :post}
  column :post_addr_index, {:as => :hidden }
  column :post_addr_country, {:as => :hidden }
  column :post_addr_region, {:as => :hidden }
  column :post_addr_district, {:as => :hidden }
  column :post_addr_city, {:as => :hidden }
  column :post_addr_street, {:as => :hidden }
  column :post_addr_building, {:as => :hidden }
  column :post_addr_additional, {:as => :hidden }

  column :fact_addr
  column :internet

  # телефоны и факсы
  column :tel_country_code, {:as => :hidden}
  column :tel_areacode, {:as => :hidden}
  column :tel_number, {:as => :hidden}
  column :tel_internal_number, {:as => :hidden}
  column :tel_display, {:as => :phonejs}


  column :fax_country_code, {:as => :hidden}
  column :fax_areacode, {:as => :hidden}
  column :fax_number, {:as => :hidden}
  column :fax_internal_number, {:as => :hidden}
  column :fax_display, {:as => :phonejs}


  column :email

  column :organization_type, {:description => true}

  column :inn, {:group => :requisites_group}
  column :kpp, {:group => :requisites_group}
  column :kpp2, {:description => true, :required => false, :group => :requisites_group}


  column :bik, {:group => :requisites_group, :description => true, :required => false}
  column :swift, {:group => :requisites_group, :description => true, :required => false}
  column :oksm

  
#  column :comment1, {:as => :hidden, :group => :reg_data_group}
  column :registry_number_2002, {:as => :hidden, :group => :reg_data_group}
  column :reg_date, {:as => :date, :description => true, :group => :reg_data_group}
  column :registry_organ_2002, {:as => :hidden, :group => :reg_data_group}

#  column :comment2, {:as => :comment, :group => :reg_data_group}
  column :ogrn, {:group => :reg_data_group}
  column :ogrn_date, {:as => :date, :description => true, :group => :reg_data_group}
  column :registry_organ, {:group => :reg_data_group, :description => true}
  column :registry_place, {:description => true, :group => :reg_data_group}

  column :registry_confirm_series, {:description => true, :group => :reg_data_group}
  column :registry_confirm_number, {:description => true, :group => :reg_data_group}

  column :okpo, {:group => :codes_group}
  column :okogu, {:group => :codes_group}
  column :okfs, {:group => :codes_group}
  column :okopf, {:group => :codes_group}
  column :okato, {:group => :codes_group}
  column :okveds, {:as => :grid, :group => :codes_group}, Organizations::Grids::Organization::Okved.new



  def initialize(*params)
    @change_alert = true
    super
  end

  validates_presence_of :full_name, :short_name, :full_name_eng, :short_name_eng, :mesto, :post_addr_display, :post_addr_index, :post_addr_country, :post_addr_region, :post_addr_district, :post_addr_city, :post_addr_street, :post_addr_building, :post_addr_additional, :fact_addr, :internet, :tel_areacode, :tel_display, :tel_country_code, :tel_number, :tel_internal_number, :fax_areacode, :fax_display, :fax_country_code, :fax_number, :fax_internal_number, :email, :inn, :kpp, :bik, :swift, :oksm, :comment1, :registry_number_2002, :reg_date, :registry_organ_2002, :ogrn, :ogrn_date, :registry_organ, :registry_place, :okpo, :okogu, :okfs, :okopf, :okato, :registry_confirm_series, :registry_confirm_number, :organization_type
  def self.human_attribute_name(attr)
    case attr
    when 'full_name', 'short_name', 'full_name_eng', 'short_name_eng', 'mesto', 'post_addr_display', 'post_addr_index', 'post_addr_country', 'post_addr_region', 'post_addr_district', 'post_addr_city', 'post_addr_street', 'post_addr_building', 'post_addr_additional', 'fact_addr', 'internet', 'tel_areacode', 'tel_display', 'tel_country_code', 'tel_number', 'tel_internal_number', 'fax_areacode', 'fax_display', 'fax_country_code', 'fax_number', 'fax_internal_number', 'email', 'inn', 'kpp', 'bik', 'swift', 'oksm', 'comment1', 'registry_number_2002', 'reg_date', 'registry_organ_2002', 'ogrn', 'ogrn_date', 'registry_organ', 'registry_place', 'okpo', 'okogu', 'okfs', 'okopf', 'okato', 'registry_confirm_series', 'registry_confirm_number', 'organization_type'
      ''
    else
      super
    end
  end
end
