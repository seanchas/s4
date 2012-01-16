class Organizations::SendCard < Base
  
  column :last_name
  column :firstname
  column :patronymic
  column :tel_areacode
  column :tel
  column :extension, {:required => false}
  column :reg_card_date, {:as => :date}
  
  
  validates_presence_of :last_name, :firstname, :patronymic, :tel_areacode, :tel, :reg_card_date
  def self.human_attribute_name(attr)
    case attr
    when 'last_name', 'firstname', 'patronymic', 'tel_areacode', 'tel', 'reg_card_date'
      ''
    else
      super
    end
  end
end