class Organizations::Organizations < Organizations::AbstractForm
  column :item_id, {:as => :hidden}
  
  #column :s4_id, {:input_html => {:readonly => true}}
  column :full_name, {:description => true}
  column :short_name, {:description => true}
  column :full_name_eng, {:description => true}
  column :short_name_eng, {:description => true}
  column :mesto, {:description => true}
  column :post_addr
  column :fact_addr
  column :internet

  column :tel_areacode
  column :tel
  column :fax_areacode
  column :fax
  column :email
  
  column :inn, {:group => :requisites_group}
  column :kpp, {:group => :requisites_group}
  column :kpp2, {:description => true, :required => false, :group => :requisites_group}

  column :bik, {:group => :requisites_group}
  column :swift, {:group => :requisites_group}
  column :oksm

  
  column :comment1, {:as => :comment, :group => :reg_data_group}
  column :registry_number_2002, {:group => :reg_data_group}
  column :reg_date, {:as => :date, :description => true, :group => :reg_data_group}
  column :registry_organ_2002, {:group => :reg_data_group}

  column :comment2, {:as => :comment, :group => :reg_data_group}
  column :ogrn, {:group => :reg_data_group}
  column :ogrn_date, {:as => :date, :description => true, :group => :reg_data_group}
  column :registry_organ, {:group => :reg_data_group}
  column :registry_place, {:description => true, :group => :reg_data_group}
  
  column :okpo, {:group => :codes_group}
  column :okogu, {:group => :codes_group}
  column :okfs, {:group => :codes_group}
  column :okopf, {:group => :codes_group}
  column :okato, {:group => :codes_group}
  column :okveds, {:as => :grid, :group => :codes_group}, Organizations::Grids::Organization::Okved.new

  def buttons
    cancelDisabled = false
    row = UserCardsSyncS4.find_by_user(s4_user)
    
    cancelButton = {
        :input => :button,
        :label => ::Formtastic::I18n.t(:grid_cancel, :scope => [:buttons]),
        :onclick => 'window.location = "/organization/reset?section=show";return false;'
    }
    cancelButton[:disabled] = :disabled if !row.show
    [
      {:input => :submit}
    ] << cancelButton
  end

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
