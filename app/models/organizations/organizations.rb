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
  column :tel_areacode
  column :tel
  column :fax_areacode
  column :fax
  column :email
  column :internet
  column :inn
  column :kpp
  column :kpp2, {:description => true}
  column :comment1, {:as => :comment}
  column :reg_date, {:as => :date}
  column :ogrn
  column :ogrn_date, {:as => :date}
  column :bik
  column :okveds, {:as => :grid}, Organizations::Grids::Organization::Okved.new
  
  column :oksm
  column :okpo
  column :okogu
  column :okfs
  column :okopf
  column :swift
  column :registry_number_2002
  column :registry_organ_2002
  column :registry_organ
  column :registry_place
  column :okato
  
  validates_presence_of :firstname, :surname, :patronymic, :position, :doc_name, :doc_number, :doc_date
  def self.human_attribute_name(attr)
    case attr
    when 'firstname', 'surname', 'patronymic', 'position', 'doc_name', 'doc_number', 'doc_date' 
      ''
    else
      super
    end
  end
end
