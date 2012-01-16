class Organizations::Filials < Base
  column :id_item, {:as => :hidden}
  column :comment1, {:as => :comment}
  column :moscow_addr, {:required => false}
  
  column :moscow_tel_areacode, {:required => false}
  column :moscow_tel, {:required => false}
  
  column :moscow_boss, {:required => false}
  column :moscow_boss_firstname, {:required => false}
  column :moscow_boss_patronymic, {:required => false}
  column :moscow_boss_position, {:required => false}
  
  column :no_moscow, {:as => :boolean, :required => false}
  
  column :filial_num
end