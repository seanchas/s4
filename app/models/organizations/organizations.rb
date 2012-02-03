class Organizations::Organizations < Base
  column :item_id, {:as => :hidden}
  
  column :s4_id, {:input_html => {:readonly => true}}
  column :full_name
  column :short_name
  column :full_name_eng
  column :short_name_eng
  column :mesto
  column :post_addr
  column :fact_addr
  column :internet

  column :tel_areacode
  column :tel
  column :fax_areacode
  column :fax
  column :email
  
  column :inn
  column :kpp
  column :kpp2, {:description => true, :required => false}

  column :bik
  column :swift
  column :oksm

  column :comment1, {:as => :comment}
  column :registry_number_2002
  column :reg_date, {:as => :date}
  column :registry_organ_2002

  column :comment2, {:as => :comment}
  column :ogrn
  column :ogrn_date, {:as => :date}
  column :registry_organ
  column :registry_place
  
  column :comment3, {:as => :comment}
  column :okpo
  column :okogu
  column :okfs
  column :okopf
  column :okato
  column :okveds, {:as => :grid}, Organizations::Grids::Organization::Okved.new


  validates_presence_of :full_name, :short_name, :full_name_eng, :short_name_eng, :mesto, :post_addr, :fact_addr, :internet, :tel_areacode, :tel, :fax_areacode, :fax, :email, :inn, :kpp, :bik, :swift, :oksm, :comment1, :registry_number_2002, :reg_date, :registry_organ_2002, :ogrn, :ogrn_date, :registry_organ, :registry_place, :okpo, :okogu, :okfs, :okopf, :okato 
  def self.human_attribute_name(attr)
    case attr
    when 'full_name', 'short_name', 'full_name_eng', 'short_name_eng', 'mesto', 'post_addr', 'fact_addr', 'internet', 'tel_areacode', 'tel', 'fax_areacode', 'fax', 'email', 'inn', 'kpp', 'bik', 'swift', 'oksm', 'comment1', 'registry_number_2002', 'reg_date', 'registry_organ_2002', 'ogrn', 'ogrn_date', 'registry_organ', 'registry_place', 'okpo', 'okogu', 'okfs', 'okopf', 'okato',  
      ''
    else
      super
    end
  end
end
