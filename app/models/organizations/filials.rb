class Organizations::Filials < Organizations::AbstractForm
  column :id_item, {:as => :hidden, :group => :filial_group}
  column :moscow_addr, {:required => false, :group => :filial_group}

  column :moscow_tel_country_code, {:group => :filial_group, :as => :hidden}
  column :moscow_tel_areacode, {:group => :filial_group, :as => :hidden}
  column :moscow_tel_number, {:group => :filial_group, :as => :hidden}
  column :moscow_tel_internal_number, {:group => :filial_group, :as => :hidden}
  column :moscow_tel_display, {:required => false, :group => :filial_group, :as => :phonejs}
  
  column :moscow_boss, {:required => false, :group => :filial_group}
  column :moscow_boss_firstname, {:required => false, :group => :filial_group}
  column :moscow_boss_patronymic, {:required => false, :group => :filial_group}
  column :moscow_boss_position, {:required => false, :group => :filial_group}
  
  column :no_moscow, {:as => :boolean, :required => false, :group => :filial_group}
  
  column :filial_num
  
  def initialize(*params)
    @change_alert = true
    super
  end
  
  def buttons
    cancelDisabled = false
    row = UserCardsSyncS4.find_by_user(s4_user)
    
    cancelButton = {
        :input => :button,
        :label => ::Formtastic::I18n.t(:grid_cancel, :scope => [:buttons]),
        :onclick => "window.location = '/organization/reset?section=filials';return false;"
    }
    cancelButton[:disabled] = :disabled if !row.filials
    [
      {:input => :submit}
    ] << cancelButton
  end
end