class Organizations::Filials < Base
  column :id_item, {:as => :hidden, :group => :filial_group}
  column :moscow_addr, {:required => false, :group => :filial_group}
  
  column :moscow_tel_areacode, {:required => false, :group => :filial_group}
  column :moscow_tel, {:required => false, :group => :filial_group}
  
  column :moscow_boss, {:required => false, :group => :filial_group}
  column :moscow_boss_firstname, {:required => false, :group => :filial_group}
  column :moscow_boss_patronymic, {:required => false, :group => :filial_group}
  column :moscow_boss_position, {:required => false, :group => :filial_group}
  
  column :no_moscow, {:as => :boolean, :required => false, :group => :filial_group}
  
  column :filial_num
end